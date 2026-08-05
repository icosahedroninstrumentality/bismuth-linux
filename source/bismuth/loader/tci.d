module bismuth.loader.tci;

import bismuth.framework;

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
	Radian[] data;
}
