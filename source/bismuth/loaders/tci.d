module bismuth.loaders.tci;

import bismuth;

enum ColorSpace {
	RGB,
	RGBA,
	LAB,
	LABA,
	RAW,
	init = RGBA,
}

class TrueColorImage {
	uint width;
	uint height;
	ColorSpace colorSpace;
	Vector[] data;
}
