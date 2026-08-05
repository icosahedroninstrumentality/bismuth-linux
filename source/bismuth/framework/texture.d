module bismuth.framework.texture;

import bismuth.framework;
import bindbc.opengl;
import std.string;

public GLuint fb;

public class Texture {
	public __gshared Texture raw = null;
	public __gshared Texture screen;
	public __gshared Texture temp;

	public __gshared bool floatRenderable;
	public __gshared GLuint internalFormat;
	public __gshared GLuint pixelType;

	public Vector2 size;
	public GLuint id;

	this (Vector2 size_) {
		size = size_;
		glGenTextures(1, &id);
		glBindTexture(GL_TEXTURE_2D, id);
		glTexImage2D(
			GL_TEXTURE_2D, 0, internalFormat,
			cast (GLsizei) size.x.raw,
			cast (GLsizei) size.y.raw,
			0, GL_RGBA, pixelType, null
		);
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_MIRRORED_REPEAT);
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_MIRRORED_REPEAT);
		//GLfloat maxAniso;
		//glGetFloatv(GL_MAX_TEXTURE_MAX_ANISOTROPY_EXT, &maxAniso);
		//if (supportedExtension("EXT_texture_filter_anisotropic")) glTexParameterf(GL_TEXTURE_2D, GL_MAX_TEXTURE_MAX_ANISOTROPY, maxAniso);
		clear();
	}

	public void use () {
		glBindFramebuffer(GL_FRAMEBUFFER, fb);
		glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, id, 0);
	}
	
	public void fill (Vector4 color) {
		use();
		glViewport(0, 0, cast (GLsizei) size.x.raw, cast (GLsizei) size.y.raw);
		glClearColor(cast (GLclampf) color.x.raw, cast (GLclampf) color.y.raw, cast (GLclampf) color.z.raw, cast (GLclampf) color.w.raw);
		glClear(GL_COLOR_BUFFER_BIT);
	}

	public void clear () {
		fill(Vector4(Radian.zero, Radian.zero, Radian.zero, Radian.one));
	}

	import bismuth.loader.png;
	import bismuth.loader.jpg;
	import bismuth.loader.heic;
	import std.path : extension;

	public static Texture loadFile(string fileName) {
		int width, height;
		ubyte[] pixels;
		auto ext = extension(fileName).toLower();

		if (ext == ".heic" || ext == ".heif") {
			pixels = loadHEIC(fileName, width, height);
		} else if (ext == ".png") {
			pixels = loadPNG(fileName.toStringz, width, height);
		} else if (ext == ".jpg" || ext == ".jpeg") {
			pixels = loadJPG(fileName.toStringz, width, height);
		} else {
			throw new Exception("Unsupported format: " ~ ext);
		}

		if (!pixels.length || width <= 0 || height <= 0)
			throw new Error("Failed to load texture file: " ~ fileName);

		// Create and upload texture (same as before)
		Texture texture = new Texture(Vector2(Radian(width), Radian(height)));
		glBindTexture(GL_TEXTURE_2D, texture.id);
		glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA8,
					 cast(GLsizei)width, cast(GLsizei)height,
					 0, GL_RGBA, GL_UNSIGNED_BYTE, pixels.ptr);
		if (ext == ".png") freePNGData(pixels);
		else if (ext == ".jpg" || ext == ".jpeg") freeJPGData(pixels);
		// For HEIC, the array is managed by GC; no extra free needed
		return texture;
	}
	
	public static void clearRaw (Vector4 color) {
		glBindFramebuffer(GL_FRAMEBUFFER, 0);
		glViewport(0, 0, cast (GLsizei) Texture.screen.size.x.raw, cast (GLsizei) Texture.screen.size.y.raw);
		glClearColor(cast (GLclampf) color.x.raw, cast (GLclampf) color.y.raw, cast (GLclampf) color.z.raw, cast (GLclampf) color.w.raw);
		glClear(GL_COLOR_BUFFER_BIT);
		glDrawArrays(GL_TRIANGLES, 0, 6);
	}
}

public class WTexture {
	Texture tex;
	Radian cellSize;
	VTexture[][] cells;
}

public @property ulong ceilPow2(ulong v) @safe pure nothrow @nogc {
	ulong n = max(v, 1) - 1;
	n |= n >> 1;
	n |= n >> 2;
	n |= n >> 4;
	n |= n >> 8;
	n |= n >> 16;
	n |= n >> 32;
	return n + 1;
}

public class VTexture {
	private static WTexture[ulong] wts;

	public WTexture parent = null;
	public Vector4 rect;

	private static void requestVT (Texture* parent, Vector4* rect) {
		Radian size = rect.z.max(rect.w);
	}

	private bool cached = false;
	private void delegate () drawCall;

	private void refresh () {
		if (!cached) drawCall();

	}
}
