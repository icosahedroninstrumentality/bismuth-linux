module bismuth;

import bismuth.framework;
import bismuth.effect;

import glfw3.api;
import bindbc.opengl;
import std.stdio;
import std.array;
import std.conv;
import std.algorithm;

ulong unixTimeNano () {
	import std.datetime;
	auto currentTime = Clock.currTime();
    Duration unixTime = currentTime - SysTime(DateTime(1970, 1, 1), UTC());
    return unixTime.total!"nsecs";
}

void enterFullscreen(GLFWwindow* window) {
    // 1. Get the primary monitor (or choose one from glfwGetMonitors)
    GLFWmonitor* monitor = glfwGetPrimaryMonitor();

    // 2. Get available video modes
    int modeCount;
    const GLFWvidmode* modes = glfwGetVideoModes(monitor, &modeCount);

    // 3. Pick a desired mode (e.g., the highest refresh rate at native resolution)
    GLFWvidmode target;
    // Start with the current mode as fallback
    target = *glfwGetVideoMode(monitor);

    // Find the one with the highest refresh
    for (int i = 0; i < modeCount; ++i) {
        if (modes[i].width == target.width &&
            modes[i].height == target.height &&
            modes[i].refreshRate > target.refreshRate) {
            target = modes[i];
        }
    }

    // 4. Switch the window to fullscreen with that mode
    glfwSetWindowMonitor(
        window,
        monitor,
        0, 0,                     // top-left corner of the monitor
        target.width, target.height,
        target.refreshRate
    );
}

void exitFullscreen(GLFWwindow* window, int winX, int winY, int winW, int winH) {
    // Go back to windowed mode (pass NULL monitor)
    glfwSetWindowMonitor(window, null, winX, winY, winW, winH, 0);
}

string[] extensions;

bool supportedExtension (string extension) {
	return extensions.canFind(extension);
}

public __gshared Texture[] wallpapers;
public Texture a;
public Texture b;
Degree alpha = Degree(-45);


ulong wallpaperSelection = 0;

const wallpaperfiles = [
	//"resources/Wallpaper/.Cryo/frutiger_cryo0.jpg",
	//"resources/Wallpaper/.Cryo/frutiger_cryo1.jpg",
	//"resources/Wallpaper/.Cryo/frutiger_cryo3.jpg",
	//"resources/Wallpaper/.Cryo/frutiger_cryo2.jpg",
	//"resources/Wallpaper/.Cryo/frutiger_cryo4.jpg",
	"resources/Wallpaper/Konu/IMG_8757.HEIC",
	"resources/Wallpaper/Ky/Ky_SanLuis.heic",
	"resources/Wallpaper/Ky/Ky_SunsetDune.heic",
	"resources/Wallpaper/Ky/Ky_Sand.heic",
	"resources/Wallpaper/Ky/Ky_DunesWandering.heic",
	"resources/Wallpaper/Ky/Ky_GalacticDunes.heic",
	"resources/Wallpaper/Ky/Ky_TwilightDunes.heic",
	"resources/Wallpaper/Konu/IMG_8455.HEIC",
	"resources/Wallpaper/Konu/IMG_8665.HEIC",
	"resources/Wallpaper/Konu/IMG_8671.HEIC",
	"resources/Wallpaper/Konu/IMG_8730.HEIC",
	"resources/Wallpaper/Konu/IMG_8729.HEIC",
	"resources/Wallpaper/Konu/IMG_8731.HEIC",
	"resources/Wallpaper/Konu/IMG_8732.HEIC",
	"resources/Wallpaper/Konu/IMG_8739.HEIC",
	"resources/Wallpaper/Konu/IMG_8740.HEIC",
	"resources/Wallpaper/Konu/IMG_8741.HEIC",
	"resources/Wallpaper/Konu/IMG_8760.HEIC",
	"resources/Wallpaper/Crystal/Black/image.jpg",
	"resources/Wallpaper/Crystal/Green/image.jpg",
	"resources/Wallpaper/Crystal/Pink/image.jpg",
	"resources/Wallpaper/Crystal/Purple/image.jpg",
	"resources/Wallpaper/Gold/Chunks/image.jpg",
	"resources/Wallpaper/Gold/Flat/image.jpg",
	"resources/Wallpaper/Gold/Rough/image.jpg",
	"resources/Wallpaper/Glass/Color/image.jpg",
	"resources/Wallpaper/Glass/White/image.jpg",
	"resources/Wallpaper/Glass/Black/image.jpg",
];

// Define your callback
extern(C) void keyCallback(GLFWwindow* window, int key, int scancode, int action, int mods) nothrow @nogc {
    if (key == GLFW_KEY_ESCAPE && action == GLFW_PRESS) {
        glfwSetWindowShouldClose(window, GLFW_TRUE);
    }
	import std.math;
	
	if (key == GLFW_KEY_RIGHT && action == GLFW_PRESS) {
        wallpaperSelection = (wallpaperSelection + 1) % wallpaperfiles.length;
    }
	if (key == GLFW_KEY_LEFT && action == GLFW_PRESS) {
        wallpaperSelection = min(wallpaperSelection - 1, wallpaperfiles.length - 1);
    }
    // Handle other keys...
}
double x, y;

public void runVideo () {
	writeln("Init graphics...");
	int width, height;

	auto status = glfwInit();
	if (!status) throw new Error("GLFW init fail> "~ to!string(status));
	scope(exit) glfwTerminate();

	// 2. Set OpenGL version hints (Core Profile 3.3)
	glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
	glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
	glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
	version(OSX) glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GLFW_TRUE);

	// Prefer a higher-bit framebuffer and an sRGB-capable back buffer when available.
	// This ensures the final blit to fb null uses the screen's native color depth
	// and preserves the precision of our internal RGBA-F16 / high-bit render targets.
	glfwWindowHint(GLFW_RED_BITS, 16);
	glfwWindowHint(GLFW_GREEN_BITS, 16);
	glfwWindowHint(GLFW_BLUE_BITS, 16);
	glfwWindowHint(GLFW_ALPHA_BITS, 16);
	glfwWindowHint(GLFW_SRGB_CAPABLE, GLFW_TRUE);

	// 3. Create window and OpenGL context
	GLFWwindow*	window = glfwCreateWindow(2880, 1800, "Bismuth", null, null);
	if (!window) return;
	scope(exit) {exitFullscreen(window, 1, 1, 1, 1);glfwDestroyWindow(window);}
	enterFullscreen(window);
	glfwMakeContextCurrent(window);
	glfwSwapInterval(1);   // Enable VSync

	glfwGetFramebufferSize(window, &width, &height);
	
	// 4. Load OpenGL function pointers
	if (
		loadOpenGL() == GLSupport.badLibrary
		|| loadOpenGL() == GLSupport.noContext
		|| loadOpenGL() == GLSupport.noLibrary
	) throw new Error("Cannot load any usable version of OpenGL!");

	extensions = glGetString(GL_EXTENSIONS).to!string.split;

	Texture.floatRenderable = supportedExtension("GL_EXT_color_buffer_float");
	Texture.internalFormat = Texture.floatRenderable ? GL_RGBA16F : GL_RGBA8;
	Texture.pixelType = Texture.floatRenderable ? GL_HALF_FLOAT : GL_UNSIGNED_BYTE;

	//if (supportedExtension("GL_EXT_framebuffer_sRGB") || supportedExtension("GL_ARB_framebuffer_sRGB")) {
	//	glEnable(GL_FRAMEBUFFER_SRGB);
	//}

	glGenFramebuffers(1, &fb);

	initEffects();
	
	wallpapers.length = wallpaperfiles.length;

	Font.setup();

	Glass dock = new Glass();
	dock.shineAngle = Degree(-45);
	dock.blur = Radian(5);

	Window windowDark = new Window();
	Window windowWhite = new Window();
	Window windowColor = new Window();
	windowDark.recolor( OKLCHA(Radian(0), Radian(0), Degree(0), Radian(1)));
	windowWhite.recolor(OKLCHA(Radian(1), Radian(0), Degree(0), Radian(1)));

	ulong lastT = unixTimeNano();
	
	// 6. Main loop
	glfwSetKeyCallback(window, &keyCallback);
	while (true) {
		ulong newT = unixTimeNano();
		Radian fps = Radian.one / (Radian(newT - lastT) / Radian(1e9));
		lastT = newT;
		if (glfwWindowShouldClose(window)) break;
		if (wallpapers[wallpaperSelection] is null) wallpapers[wallpaperSelection] = Texture.loadFile(wallpaperfiles[wallpaperSelection]);
		alpha += Degree(1);

		glfwGetFramebufferSize(window, &width, &height);
		if (Texture.screen is null || Texture.screen.size != Vector2(Radian(width), Radian(height))) Texture.screen = new Texture(Vector2(Radian(width), Radian(height)));
		if (Texture.temp is null || Texture.temp.size != Texture.screen.size) { Texture.temp = new Texture(Texture.screen.size); }

		dock.shape = Shape(
			Vector2(Texture.screen.size.x / Radian.two, Radian(70)),
			Vector2(Radian(600), Radian(60)),
			Vector2(Radian(40), Radian(40)),
		);
		
		glViewport(0, 0, width, height);

		//glClearColor(Radian.zero, Radian.zero, Radian.zero, Radian.one);
		//glClear(GL_COLOR_BUFFER_BIT);

		double nx, ny;
		glfwGetCursorPos(window, &nx, &ny);
		ny = Texture.screen.size.y.raw - ny;
		if (nx == x && ny == y) {
			glfwPollEvents();
			continue;
		}
		x = nx;
		y = ny;

		Radian s = (Texture.screen.size.x / wallpapers[wallpaperSelection].size.x).max(Texture.screen.size.y / wallpapers[wallpaperSelection].size.y);
		auto src = Vector4(
			(wallpapers[wallpaperSelection].size.x - Texture.screen.size.x / s) / Radian.two,
			(wallpapers[wallpaperSelection].size.y - Texture.screen.size.y / s) / Radian.two,
			Texture.screen.size.x / s,
			Texture.screen.size.y / s,
		);
		Copy.draw(src, wallpapers[wallpaperSelection], Vector4(Radian.zero, Radian.zero, Texture.screen.size.x, Texture.screen.size.y), Texture.screen);

		Font.paragraph.drawText("ABCDEFGHIJKLMNOPQRSTUVWXYZ", Vector4.one,                                       Vector2(Radian(32), Texture.screen.size.y - Radian(128)    ), Radian(64), Radian(x) / Texture.screen.size.x, Radian(y) / Texture.screen.size.y, Texture.screen.size.x);
		Font.paragraph.drawText("abcdefghijklmnopqrstuvwxyz", Vector4.one,                                       Vector2(Radian(32), Texture.screen.size.y - Radian(256)    ), Radian(64), Radian(x) / Texture.screen.size.x, Radian(y) / Texture.screen.size.y, Texture.screen.size.x);
		Font.paragraph.drawText("0123456789=+-*/|\\.:,;!?_\"'()[]{}<>", Vector4.one,                             Vector2(Radian(32), Texture.screen.size.y - Radian(384)    ), Radian(64), Radian(x) / Texture.screen.size.x, Radian(y) / Texture.screen.size.y, Texture.screen.size.x);
		Font.paragraph.drawText("The quick brown fox jumped over the lazy dog.", Vector4.one,                    Vector2(Radian(32), Texture.screen.size.y - Radian(512)    ), Radian(64), Radian(x) / Texture.screen.size.x, Radian(y) / Texture.screen.size.y, Texture.screen.size.x);
		Font.paragraph.drawText("This text is being rendered through Bismuth's new text pipeline!", Vector4.one, Vector2(Radian(32), Texture.screen.size.y - Radian(512+128)), Radian(64), Radian(x) / Texture.screen.size.x, Radian(y) / Texture.screen.size.y, Texture.screen.size.x);
		import std.conv;
		Font.paragraph.drawText("FPS: "~to!string(fps), Vector4.one, Vector2(Radian(0), Radian(32)), Radian(32), Radian.one, Radian.zero);

		windowDark.resize(Vector4(Radian(x), Radian(y), Radian(600), Radian(400)));
		windowWhite.resize(Vector4(Radian(x), Radian(y + 500), Radian(600), Radian(400)));
		windowColor.resize(Vector4(Radian(x), Radian(y + 1000), Radian(600), Radian(400)));
		windowColor.recolor(OKLCHA(
			Radian(.7), Radian(.2), Degree(x / Texture.screen.size.x.raw * 360), Radian.one,
		));
		windowDark.draw();
		windowWhite.draw();
		windowColor.draw();
		
		//for (ulong i = 0; i < 5; i++)
		//drawGlass(Glass(Shape(
		//	Vector2(500+x - i, y - i * (300 - i * 20)),
		//	Vector2(300 - i * 20,   150 - i * 20),
		//	Vector2(150 - i * 20,   150 - i * 20),
		//), alpha, PI*-.25, 5));

		import bismuth.hi;
		//drawHi(Vector2(x,y), 1);
		// mouse
		//drawGlass(Glass(Shape(Vector2(x, y), Vector2(10, 10), Vector2(10, 10))), Texture.screen, Texture.screen);
		//drawGlass(Glass(Shape(Vector2(x, y), Vector2( 5,  5), Vector2( 5,  5))), Texture.screen, Texture.screen);

		dock.draw();

		Copy.draw(
			Vector4(Radian.zero, Radian.zero, Texture.screen.size.x, Texture.screen.size.y),
			Texture.screen,
			Vector4(Radian.zero, Radian.zero, Texture.screen.size.x, Texture.screen.size.y),
			Texture.raw
		);

		glfwSwapBuffers(window);

		glfwPollEvents();
	}
}

class Window {
	static enum Radian unit = Radian(15);
	
	private Vector4 rect = Vector4.zero;
	private OKLCHA back = OKLCHA().opaque;

	private @property Vector2 half () { return Vector2(rect.z / Radian.two, rect.w / Radian.two); }
	private @property Vector2 center () { return Vector2(rect.x + rect.z / Radian.two, rect.y + rect.w / Radian.two); }
	private @property OKLCHA complement () { return back.invertLuma(Radian(.2)); }
	private @property OKLCHA theme () {
		return back.mix(OKLCHA(Radian(.7), Radian(.2), Degree(180), Radian(1)), Radian(.5));
	}

	private Glass base;
	private Glass sidebar;
	private Shape content;
	private Glass trafficRed;
	private Glass trafficOrange;
	private Glass trafficGreen;

	this () {
		base = new Glass();
		sidebar = new Glass();
		trafficRed = new Glass();
		trafficOrange = new Glass();
		trafficGreen = new Glass();
		base.reflection = Vector4.zero;
		base.transmission = Vector4.zero;
		base.emission = Vector4.zero;
		sidebar.shineAngle = Degree(-45);
		base.shineAngle = Degree(-45);
		sidebar.blur = Radian(5);
		trafficRed.transmission = Vector4.zero;
		trafficRed.shineAngle = Degree(-45);
		trafficOrange.transmission = Vector4.zero;
		trafficOrange.shineAngle = Degree(-45);
		trafficGreen.transmission = Vector4.zero;
		trafficGreen.shineAngle = Degree(-45);
		trafficRed.emission =    OKLCHA(Radian(.75), Radian(.2), Degree( 30), Radian(1));
		trafficOrange.emission = OKLCHA(Radian(.75), Radian(.2), Degree( 75), Radian(1));
		trafficGreen.emission =  OKLCHA(Radian(.75), Radian(.2), Degree(135), Radian(1));
		trafficRed.border =      OKLCHA(Radian(.6), Radian(.2), Degree( 30), Radian(1));
		trafficOrange.border =   OKLCHA(Radian(.6), Radian(.2), Degree( 75), Radian(1));
		trafficGreen.border =    OKLCHA(Radian(.6), Radian(.2), Degree(135), Radian(1));
		trafficRed.reflection =  Vector4.zero;
		trafficOrange.reflection =  Vector4.zero;
		trafficGreen.reflection =  Vector4.zero;
	}

	public void recolor (OKLCHA _back) {
		back = _back.opaque;
		base.emission = back;
		sidebar.border = theme;
	}

	public void resize (Vector4 _rect) {
		rect = _rect;
		base.shape = RectRound(
			Vector2(rect.x, rect.y),
			Vector2(rect.z, rect.w),
			Vector2(unit * Radian(2.5), unit * Radian(2.5)),
		);
		sidebar.shape = RectRound(
			Vector2(rect.x + unit * Radian(.5), rect.y + unit * Radian(.5)),
			Vector2(unit * Radian(15), rect.w - unit),
			Vector2(unit * Radian(2), unit * Radian(2)),
		);
		content = RectRound(
			Vector2(rect.x + unit * Radian(16), rect.y + unit * Radian(.5)),
			Vector2(rect.z - unit * Radian(16.5), rect.w - unit),
			Vector2(unit * Radian(2), unit * Radian(2)),
		);
		trafficRed.shape = RectRound(
			Vector2(rect.x + unit * Radian(1.5), rect.y + rect.w - unit * Radian(3.5)),
			Vector2(unit * Radian(2), unit * Radian(2)),
			Vector2(unit, unit),
		);
		trafficOrange.shape = trafficRed.shape;
		trafficOrange.shape.position += Vector2(unit * Radian(3), Radian.zero);
		trafficGreen.shape = trafficOrange.shape;
		trafficGreen.shape.position += Vector2(unit * Radian(3), Radian.zero);
	}

	public void draw () {
		base.draw();
		drawShape(Surface(
			content,
			OKLCHA.black,
			complement,
			Border(Radian(1), complement),
		));
		Gradient.draw(Texture.temp, Texture.screen, Vector4(rect.x + unit, rect.y + unit, sidebar.shape.size.x * Radian.two, sidebar.shape.size.y * Radian.two), Degree(45), theme, back);
		sidebar.draw(Texture.screen, Texture.temp, Texture.screen);
		trafficRed.draw();
		trafficOrange.draw();
		trafficGreen.draw();
		//Font.paragraph.drawText("New window", 1-back, trafficRed.shape.position + Vector2(unit * 2, 0), unit, 1, 0);
	}
}
