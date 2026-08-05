module bismuth.loader.jpg;

import core.stdc.stdio : fprintf, stderr;
import core.stdc.stdlib : free;

// C declarations
extern(C):
void* stbi_load(const char* filename, int* x, int* y, int* channels, int desired);
void  stbi_image_free(void* data);
void  stbi_set_flip_vertically_on_load(int flip); // optional

// Load JPG/JPEG → RGBA byte slice
/// caller must free with freeJPGData
ubyte[] loadJPG(const char* filename, out int width, out int height) {
	stbi_set_flip_vertically_on_load(1);

	int w, h, comp;
	void* data = stbi_load(filename, &w, &h, &comp, 4); // force RGBA
	if (data is null) {
		fprintf(stderr, "Failed to load JPG: %s\n", filename);
		width = height = 0;
		return null;
	}
	width = w;
	height = h;
	return (cast(ubyte*)data)[0 .. w * h * 4];
}

void freeJPGData(ubyte[] data) {
	if (data.ptr !is null) stbi_image_free(data.ptr);
}
