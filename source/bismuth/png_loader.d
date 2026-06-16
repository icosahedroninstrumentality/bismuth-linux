module bismuth.png_loader;

import core.stdc.stdio : fprintf, stderr;
import core.stdc.stdlib : free;

// C declarations
extern(C):
void* stbi_load(const char* filename, int* x, int* y, int* channels, int desired);
void  stbi_image_free(void* data);
void  stbi_set_flip_vertically_on_load(int flip); // optional

// Load PNG → RGBA byte slice (caller must free with freePNGData)
ubyte[] loadPNG(const char* filename, out int width, out int height) {
    stbi_set_flip_vertically_on_load(1);

    int w, h, comp;
    void* data = stbi_load(filename, &w, &h, &comp, 4); // force RGBA
    if (data is null) {
        fprintf(stderr, "Failed to load PNG: %s\n", filename);
        width = height = 0;
        return null;
    }
    width = w;
    height = h;
    return (cast(ubyte*)data)[0 .. w * h * 4];
}

void freePNGData(ubyte[] data) {
    if (data.ptr !is null) stbi_image_free(data.ptr);
}