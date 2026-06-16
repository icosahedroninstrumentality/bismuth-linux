module bismuth;

import glfw3.api;
import bindbc.opengl;
import std.stdio;
import std.array;
import std.conv;
import std.algorithm;

public import vector;
public import bismuth.texture;
public import bismuth.shader;
public import bismuth.effect.glass;
public import bismuth.effect.copy;



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

	initGlass();
	initCopy();

	int width, height;
	glfwGetFramebufferSize(window, &width, &height);
	screenSize = Vector2(width, height);

	wallpaper = Texture.loadFile("resources/Wallpaper/Ky/1.png");

	import std.math : PI;
	Vector alpha = PI * 0.75;

	a = new Texture(screenSize);
	b = new Texture(screenSize);

	// 6. Main loop
	while (!glfwWindowShouldClose(window)) {
		alpha += 0.01f;

		glfwGetFramebufferSize(window, &width, &height);
		screenSize = Vector2(width, height);

		if (a is null || a.size != screenSize) {
			a = new Texture(screenSize);
		}
		if (b is null || b.size != screenSize) {
			b = new Texture(screenSize);
		}
		
		glViewport(0, 0, width, height);

		glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
		glClear(GL_COLOR_BUFFER_BIT);

		double x, y;
		glfwGetCursorPos(window, &x, &y);

		a.clear();

		drawCopy(CopyInstruction(
			Vector4(0, 0, wallpaper.size.x, wallpaper.size.y),
			wallpaper,
			Vector4(0, 0, screenSize.x, screenSize.y),
			a,
		));

		drawGlass(Glass(
			Shape(
				Vector2(width / 2, 60),
				Vector2(600, 40),
				Vector2(30, 30),
			),
			Color(0.95, 0.96, 0.97, 1.0),
			Color(0.95, 0.96, 0.97, 1.0),
			Color(0.01, 0.02, 0.03, 1.0),
			Color(0.50, 0.50, 0.50, 1.0),
			alpha,
		), a, a);

		drawGlass(Glass(
			Shape(
				Vector2(x, height - y),
				Vector2(10, 10),
				Vector2(10, 10),
			),
			Color(0.35, 0.36, 0.37, 1.0),
			Color(0.35, 0.36, 0.37, 1.0),
			Color(0.01, 0.02, 0.03, 1.0),
			Color(0.35, 0.36, 0.37, 1.0),
			alpha,
		), a, a);

		drawGlass(Glass(
			Shape(
				Vector2(x, height - y),
				Vector2(5, 5),
				Vector2(5, 5),
			),
			Color(0.95, 0.96, 0.97, 1.0),
			Color(0.95, 0.96, 0.97, 1.0),
			Color(0.01, 0.02, 0.03, 1.0),
			Color(1.00, 1.00, 1.00, 1.0),
			alpha,
		), a, a);

		drawGlass(Glass(
			Shape(
				Vector2(width - 110, height - 60),
				Vector2(100, 50),
				Vector2(20, 20),
			),
			Color(0.95, 0.96, 0.97, 1.0),
			Color(0.95, 0.96, 0.97, 1.0),
			Color(0.01, 0.02, 0.03, 1.0),
			Color(0.50, 0.50, 0.50, 1.0),
			alpha,
		), a, a);

		drawCopy(CopyInstruction(
			Vector4(0, 0, screenSize.x, screenSize.y),
			a,
			Vector4(0, 0, screenSize.x, screenSize.y),
			Texture.raw
		));

		glfwSwapBuffers(window);
		glfwPollEvents();
	}
}