module bismuth.heic_loader;

import std.string : toStringz;
import std.exception : enforce;
import core.stdc.stdlib;
import std.stdio : writeln;   // for debugging
import std.conv;
import core.stdc.string : memcpy;

extern (C):

struct heif_context;
struct heif_image_handle;
struct heif_image;

enum heif_colorspace : int {
	YCbCr = 0,
	RGB	= 1,
}

enum heif_chroma : int {
	monochrome = 0,
	chroma_420 = 1,
	chroma_422 = 2,
	chroma_444 = 3,
	interleaved_RGB = 10,
	interleaved_RGBA = 11,
}

enum heif_channel : int {
	Y = 0,
	Cb = 1,
	Cr = 2,
	R = 3,
	G = 4,
	B = 5,
	Alpha = 6,
	interleaved = 10,
}

heif_context* heif_context_alloc();
void heif_context_free(heif_context*);
int heif_context_read_from_file(heif_context*, const char* filename, void*);
int heif_context_get_primary_image_handle(heif_context*, heif_image_handle**);
void heif_image_handle_release(heif_image_handle*);

int heif_decode_image(heif_image_handle*, heif_image**, heif_colorspace, heif_chroma, void*);
void heif_image_release(heif_image*);

int heif_image_get_width(heif_image*);
int heif_image_get_height(heif_image*);

ubyte* heif_image_get_plane(heif_image*, heif_channel, int* stride);

int heif_image_handle_get_width(heif_image_handle*);
int heif_image_handle_get_height(heif_image_handle*);

ubyte[] loadHEIC(string filename, out int width, out int height, bool flipVertical = true) {
	writeln("Loading HEIC: ", filename);

	auto ctx = heif_context_alloc();
	if (ctx is null) throw new Exception("heif_context_alloc failed");
	scope(exit) {
		writeln("  releasing context");
		heif_context_free(ctx);
	}

	int err = heif_context_read_from_file(ctx, filename.toStringz, null);
	writeln("  read_from_file: ", err);
	if (err != 0)
		throw new Exception("Failed to read HEIC file (err " ~ err.to!string ~ "): " ~ filename);

	heif_image_handle* handle;
	err = heif_context_get_primary_image_handle(ctx, &handle);
	writeln("  get_primary_image_handle: ", err);
	if (err != 0)
		throw new Exception("No primary image (err " ~ err.to!string ~ ")");

	width = heif_image_handle_get_width(handle);
	height = heif_image_handle_get_height(handle);
	writeln("  handle dimensions: ", width, " x ", height);
	if (width <= 0 || height <= 0)
		throw new Exception("Invalid image dimensions from handle");

	heif_image* img = null;
	bool isRGBA = false;

	err = heif_decode_image(
		handle,
		&img,
		heif_colorspace.RGB,
		heif_chroma.interleaved_RGBA,
		null
	);
	writeln("  decode_image (RGBA) returned: ", err);
	if (err == 0 && img !is null) {
		isRGBA = true;
	} else {
		err = heif_decode_image(
			handle,
			&img,
			heif_colorspace.RGB,
			heif_chroma.interleaved_RGB,
			null
		);
		writeln("  decode_image (RGB) returned: ", err);
		if (err != 0 || img is null)
			throw new Exception("Failed to decode HEIC (both RGBA and RGB)");
		isRGBA = false;
	}

	writeln("  releasing handle");
	heif_image_handle_release(handle);
	handle = null;

	int bpp = isRGBA ? 4 : 3;
	int stride;
	ubyte* data = heif_image_get_plane(img, heif_channel.interleaved, &stride);
	if (data is null)
		throw new Exception("No interleaved plane available");
	if (stride == 0)
		throw new Exception("heif_image_get_plane returned stride 0");
	writeln("  stride: ", stride, " (expected ", width * bpp, ")");

	auto totalBytes = width * height * bpp;
	auto pixels = new ubyte[totalBytes];

	if (stride == width * bpp) {
		memcpy(pixels.ptr, data, totalBytes);
	} else {
		for (int y = 0; y < height; y++) {
			auto src = data + y * stride;
			auto dst = pixels.ptr + y * width * bpp;
			memcpy(dst, src, width * bpp);
		}
	}

	writeln("  releasing image");
	heif_image_release(img);
	img = null;

	// ----- Vertical flip (optional, default on) -----
	if (flipVertical) {
		writeln("  applying vertical flip");
		auto rowSize = width * bpp;
		auto temp = new ubyte[rowSize];
		for (int y = 0; y < height / 2; y++) {
			auto top = pixels.ptr + y * rowSize;
			auto bottom = pixels.ptr + (height - 1 - y) * rowSize;
			memcpy(temp.ptr, top, rowSize);
			memcpy(top, bottom, rowSize);
			memcpy(bottom, temp.ptr, rowSize);
		}
	}

	writeln("  loaded ", pixels.length, " bytes (bpp=", bpp, ")");
	return pixels;
}