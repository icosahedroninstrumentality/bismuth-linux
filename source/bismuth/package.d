module bismuth;

import glfw3.api;
import bindbc.opengl;
import std.stdio;
import std.array;
import std.conv;
import std.algorithm;

public import bismuth.texture;
public import bismuth.shader;
public import bismuth.effect.copy;
public import bismuth.effect.blur;
public import bismuth.effect.glass;
public import bismuth.effect.gradient;
public import bismuth.effect.glass_stroke;
public import bismuth.effect.stroke;
public import bismuth.effect.shape;
public import bismuth.text;
public import bismuth.framework;
public import prototypes;



public Vector2 screenSize;
public GLuint fb;



string[] extensions;

bool supportedExtension (string extension) {
	return extensions.canFind(extension);
}

public __gshared Texture[] wallpapers;
public Texture a;
public Texture b;

ulong wallpaperSelection = 0;

const wallpaperfiles = [
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
	"resources/Wallpaper/Glass/Black/image.jpg",
	"resources/Wallpaper/Glass/Color/image.jpg",
	"resources/Wallpaper/Glass/White/image.jpg",
	"resources/Wallpaper/Gold/Chunks/image.jpg",
	"resources/Wallpaper/Gold/Flat/image.jpg",
	"resources/Wallpaper/Gold/Rough/image.jpg",
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
	// 1. Initialize GLFW
	auto status = glfwInit();
	if (!status) return;
	scope(exit) glfwTerminate();

	screenSize = Vector2(0, 0);

	// 2. Set OpenGL version hints (Core Profile 3.3)
	glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
	glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
	glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
	version(OSX) glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GLFW_TRUE);

	// 3. Create window and OpenGL context
	GLFWwindow* window = glfwCreateWindow(2880, 1800, "Bismuth", null, null);
	if (!window) return;
	scope(exit) glfwDestroyWindow(window);
	glfwMakeContextCurrent(window);
	glfwSwapInterval(1);   // Enable VSync

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

	glGenFramebuffers(1, &fb);

	initBlur();
	initGlass();
	initGradient();
	initStroke();
	initGlassStroke();
	initShape();

	int width, height;
	glfwGetFramebufferSize(window, &width, &height);
	screenSize = Vector2(width, height);

	import core.thread;
	
	wallpapers.length = wallpaperfiles.length;
	
	import std.math : PI;
	Vector alpha = PI * 0.75;

	Font.setup();

	// 6. Main loop
	glfwSetKeyCallback(window, &keyCallback);
	while (!glfwWindowShouldClose(window)) {
		if (wallpapers[wallpaperSelection] is null) wallpapers[wallpaperSelection] = Texture.loadFile(wallpaperfiles[wallpaperSelection]);
		alpha += 0.01f;

		glfwGetFramebufferSize(window, &width, &height);
		screenSize = Vector2(width, height);

		if (Texture.screen is null || Texture.screen.size != screenSize) { Texture.screen = new Texture(screenSize); }
		if (Texture.temp is null || Texture.temp.size != screenSize) { Texture.temp = new Texture(screenSize); }
		
		glViewport(0, 0, width, height);

		//glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
		//glClear(GL_COLOR_BUFFER_BIT);

		glfwGetCursorPos(window, &x, &y);
		y = screenSize.y - y;

		

		auto s = max(screenSize.x / wallpapers[wallpaperSelection].size.x, screenSize.y / wallpapers[wallpaperSelection].size.y);
		auto src = Vector4(
			(wallpapers[wallpaperSelection].size.x - screenSize.x / s) / 2,
			(wallpapers[wallpaperSelection].size.y - screenSize.y / s) / 2,
			screenSize.x / s,
			screenSize.y / s,
		);
		Copy.draw(src, wallpapers[wallpaperSelection], Vector4(0, 0, screenSize.x, screenSize.y), Texture.screen);

		// dock
		drawGlass(Glass(
			Shape(
				Vector2(width / 2, 50),
				Vector2(600, 40),
				Vector2(30, 30),
			),
			0,
			0,
		), Texture.screen, Texture.screen);

		//Font.paragraph.drawText("ABCDEFGHIJKLMNOPQRSTUVWXYZ", Vector2(32, screenSize.y - 128), 64, x / screenSize.x, y / screenSize.y, screenSize.x);
		//Font.paragraph.drawText("abcdefghijklmnopqrstuvwxyz", Vector2(32, screenSize.y - 256), 64, x / screenSize.x, y / screenSize.y, screenSize.x);
		//Font.paragraph.drawText("0123456789=+-*/|\\.:,;!?_\"'()[]{}<>", Vector2(32, screenSize.y - 384), 64, x / screenSize.x, y / screenSize.y, screenSize.x);
		//Font.paragraph.drawText("The quick brown fox jumped over the lazy dog.", Vector2(32, screenSize.y - 512), 64, x / screenSize.x, y / screenSize.y, screenSize.x);
		//Font.paragraph.drawText("This text is being rendered through Bismuth's new text pipeline!", Vector2(32, screenSize.y - 512-128), 64, x / screenSize.x, y / screenSize.y, screenSize.x);

		//drawWindow(Vector4(x, y, 500, 300));

		import bismuth.hi;
		drawHi(Vector2(x,y), 1);
		// mouse
		drawGlass(Glass(Shape(Vector2(x, y), Vector2(10, 10), Vector2(10, 10))), Texture.screen, Texture.screen);
		drawGlass(Glass(Shape(Vector2(x, y), Vector2( 5,  5), Vector2( 5,  5))), Texture.screen, Texture.screen);

		Copy.draw(
			Vector4(0, 0, screenSize.x, screenSize.y),
			Texture.screen,
			Vector4(0, 0, screenSize.x, screenSize.y),
			Texture.raw
		);

		glfwSwapBuffers(window);
		glfwPollEvents();
	}
}



void drawWindow (Vector4 rect) {
	enum Vector unit = Vector(10);

	enum Color teal = Color(.4, .8, .9, 1);

	Vector2 topLeft = Vector2(rect.x - rect.z / 2, rect.y - rect.w / 2);
	
	drawShape(Surface(Shape(
		Vector2(rect.x + rect.z / 2, rect.y + rect.w / 2),
		Vector2(rect.z / 2, rect.w / 2),
		Vector2(unit * 2, unit * 2),
	), Color.zero, Color(1, 1, 1, 1), Border(0, Color.zero)));
	
	drawGradient(Texture.temp, Texture.screen, Shape(
		Vector2(rect.x + rect.z / 2 + unit - (rect.z / 2 - 100), rect.y + rect.w / 2 + unit),
		Vector2(100, rect.w / 2 - unit),
		Vector2(unit, unit),
	), PI * -0.75, Color.one, teal / 2 + Vector4(0.5, 0.5, 0.5, 0.5));
	drawGlass(Glass(Shape(
		Vector2(rect.x + rect.z / 2 + unit - (rect.z / 2 - 100), rect.y + rect.w / 2 + unit),
		Vector2(100, rect.w / 2 - unit),
		Vector2(unit, unit),
	), 0, PI*0.75, 0, Color.one, Glass().reflection, Glass().emission, Glass().shine, teal), Texture.screen, Texture.temp, Texture.screen);
	drawGlass(Glass(Shape(
		Vector2(rect.x + rect.z / 2 + unit * 2, rect.y + rect.w / 2 + unit * 2),
		Vector2(15, 15),
		Vector2(15, 15),
	), 0, PI*0.75, 4, Color(0.8, 0.1, 0.15, 1), Color.zero, Color(0.8, 0.1, 0.15, 1)));
}
