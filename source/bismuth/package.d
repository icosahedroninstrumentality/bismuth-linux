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
public import bismuth.effect.glass_stroke;
public import bismuth.effect.shape;



public Vector2 screenSize;
public GLuint fb;



string[] extensions;

bool supportedExtension (string extension) {
	return extensions.canFind(extension);
}

public Texture wallpaper;
public Texture a;
public Texture b;

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

	initCopy();
	initBlur();
	initGlass();
	initGlassStroke();
	initShape();

	int width, height;
	glfwGetFramebufferSize(window, &width, &height);
	screenSize = Vector2(width, height);

	wallpaper = Texture.loadFile("resources/Wallpaper/Ky/Ky_DunesWandering.heic");

	import std.math : PI;
	Vector alpha = PI * 0.75;

	// 6. Main loop
	while (!glfwWindowShouldClose(window)) {
		alpha += 0.01f;

		glfwGetFramebufferSize(window, &width, &height);
		screenSize = Vector2(width, height);

		if (Texture.screen is null || Texture.screen.size != screenSize) {
			Texture.screen = new Texture(screenSize);
		}
		
		glViewport(0, 0, width, height);

		glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
		glClear(GL_COLOR_BUFFER_BIT);

		double x, y;
		glfwGetCursorPos(window, &x, &y);
		y = screenSize.y - y;

		Texture.screen.clear();

		auto s = max(screenSize.x / wallpaper.size.x, screenSize.y / wallpaper.size.y);
		auto src = Vector4(
			(wallpaper.size.x - screenSize.x / s) / 2,
			(wallpaper.size.y - screenSize.y / s) / 2,
			screenSize.x / s,
			screenSize.y / s
		);
		drawCopy(CopyInstruction(src, wallpaper, Vector4(0, 0, screenSize.x, screenSize.y), Texture.screen));

		Vector size = 300;

		drawGlassStroke(
			GlassStroke(
				([
					CubicBezier(
					    Vector2(x - size * 0.2, y + size * 0.0),
					    Vector2(x + size * 0.2, y + size * 0.2),
					    Vector2(x + size * 0.7, y + size * 0.9),
					    Vector2(x + size * 0.4, y + size * 0.9),
					),
					CubicBezier(
					    Vector2(x + size * 0.4, y + size * 0.9),
					    Vector2(x + size * 0.2, y + size * 0.9),
					    Vector2(x + size * 0.2, y + size * 0.0),
					    Vector2(x + size * 0.2, y + size * 0.0),
					),
					CubicBezier(
					    Vector2(x + size * 0.2, y + size * 0.0),
					    Vector2(x + size * 0.3, y + size * 0.4),
					    Vector2(x + size * 0.5, y + size * 0.4),
					    Vector2(x + size * 0.5, y + size * 0.2),
					),
					CubicBezier(
					    Vector2(x + size * 0.5, y + size * 0.2),
					    Vector2(x + size * 0.5, y + size * 0.1),
					    Vector2(x + size * 0.5, y + size * 0.0),
					    Vector2(x + size * 0.6, y + size * 0.0),
					),
					CubicBezier(
					    Vector2(x + size * 0.6, y + size * 0.0),
					    Vector2(x + size * 0.7, y + size * 0.0),
					    Vector2(x + size * 0.8, y + size * 0.4),
					    Vector2(x + size * 0.8, y + size * 0.4),
					),
					CubicBezier(
					    Vector2(x + size * 0.8, y + size * 0.4),
					    Vector2(x + size * 0.8, y + size * 0.2),
					    Vector2(x + size * 0.8, y + size * 0.0),
					    Vector2(x + size * 0.9, y + size * 0.0),
					),
					CubicBezier(
					    Vector2(x + size * 0.9, y + size * 0.0),
					    Vector2(x + size * 1.0, y + size * 0.0),
					    Vector2(x + size * 1.1, y + size * 0.2),
					    Vector2(x + size * 1.2, y + size * 0.4),
					),
					CubicBezier(
					    Vector2(x + size * 0.85, y + size * 0.675),
					    Vector2(x + size * 0.85, y + size * 0.675),
					    Vector2(x + size * 0.85, y + size * 0.675),
					    Vector2(x + size * 0.85, y + size * 0.675),
					),
				]),
				18,
				alpha,
				8,
				Color(0.51, 0.52, 0.53, 1.0),
				Color(0.27, 0.28, 0.29, 1.0),
				Color(0.5, 0.5, 0.5, 1.0),
				Vector4.one,
				4.0
			), Texture.screen
		);

		// dock
		drawGlass(Glass(
			Shape(
				Vector2(width / 2, 50),
				Vector2(600, 40),
				Vector2(30, 30),
			),
			alpha,
			8.0,
		), Texture.screen, Texture.screen);

		// mouse
		drawGlass(Glass(
			Shape(
				Vector2(x, y),
				Vector2(10, 10),
				Vector2(10, 10),
			),
			alpha,
			0.0,
			Color(0.35, 0.36, 0.37, 1.0),
			Color(0.35, 0.36, 0.37, 1.0),
			Color(0.01, 0.02, 0.03, 1.0),
		), Texture.screen, Texture.screen);

		drawGlass(Glass(
			Shape(
				Vector2(x, y),
				Vector2(5, 5),
				Vector2(5, 5),
			),
			alpha,
			0.0,
			Color(0.95, 0.96, 0.97, 1.0),
			Color(0.95, 0.96, 0.97, 1.0),
			Color(0.21, 0.22, 0.23, 1.0),
		), Texture.screen, Texture.screen);

		drawCopy(CopyInstruction(
			Vector4(0, 0, screenSize.x, screenSize.y),
			Texture.screen,
			Vector4(0, 0, screenSize.x, screenSize.y),
			Texture.raw
		));

		glfwSwapBuffers(window);
		glfwPollEvents();
	}
}