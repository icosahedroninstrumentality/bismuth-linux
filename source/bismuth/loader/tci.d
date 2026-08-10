module bismuth.loader.tci;

import bismuth.framework;

enum ColorSpace : ushort {
	RGB = 0,
	RGBA = 1,
	OKLCH = 2,
	OKLCHA = 3,
}

struct TCIMetadata {
	ushort width;
	ushort height;
	ColorSpace colorSpace;
}

public void loadTCI (string file) {
	import std.file;
	
	auto data = read(file);
}
