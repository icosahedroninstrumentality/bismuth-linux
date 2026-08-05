module bismuth.framework.opengl;

import bismuth.framework;
import bindbc.opengl;
import std.stdio;

public struct Shape {
	Vector2 position;
	Vector2 size;
	Vector2 radius;
	Degree angle = 0;
}

/// bottom-left origin corner
public struct RectRound {
	Vector2 position;
	Vector2 size;
	Vector2 corner;
	Degree angle = 0;

	public Shape toShape () const {
		return Shape(
			position + size / Radian.two,
			size / Radian.two,
			corner,
			angle,
		);
	}

	alias toShape this;
}

public struct Border {
	Radian width;
	Vector4 color;
}

public struct Surface {
	Shape shape;
	Vector4 albedo;
	Vector4 emission;
	//Outline[] outlines;
	//Border[] borders;
	Border border;
}

public class Uniform (T) {
	public string name;
	public GLint location;
	public T cache;

	this (
		string name_,
		GLint location_,
		T cache_ = T.init,
	) {
		this.name = name_;
		this.location = location_;
		this.cache = cache_;
	}

	public void set (T data) { cache = data; }

	public void upload (int* texUnit) {
		static if (is(T == bool))           glUniform1i(location, cache);
		else static if (is(T == int))       glUniform1i(location, cache);
		else static if (is(T == Radian))    glUniform1f(location, cache.raw);
		else static if (is(T == Degree))    glUniform1f(location, cache.rad.raw);
		else static if (is(T == Vector2))   glUniform2f(location, cache.x.raw, cache.y.raw);
		else static if (is(T == Vector3))   glUniform3f(location, cache.x.raw, cache.y.raw, cache.z.raw);
		else static if (is(T == Vector4))   glUniform4f(location, cache.x.raw, cache.y.raw, cache.z.raw, cache.w.raw);
		else static if (is(T == int[]))     glUniform1iv(location, cast(GLsizei) cache.length, cast(GLint*) cache.ptr);
		else static if (is(T == Radian[]))  glUniform1fv(location, cast(GLsizei) cache.length, cast(GLfloat*) cache.ptr);
		else static if (is(T == Degree[])) {Radian[] array; foreach (Degree key; cache) array ~= key.rad.raw; glUniform1fv(location, cast(GLsizei) array.length, cast (GLfloat*) array.ptr);}
		else static if (is(T == Vector2[])) glUniform2fv(location, cast(GLsizei) cache.length, cast(GLfloat*) cache.ptr);
		else static if (is(T == Vector3[])) glUniform3fv(location, cast(GLsizei) cache.length, cast(GLfloat*) cache.ptr);
		else static if (is(T == Vector4[])) glUniform4fv(location, cast(GLsizei) cache.length, cast(GLfloat*) cache.ptr);
		else static if (is(T == Texture)) {
			glActiveTexture(GL_TEXTURE0 + *texUnit);
			glBindTexture(GL_TEXTURE_2D, cache.id);
			glUniform1i(location, *texUnit);
			(*texUnit)++;
		}
	}
}



public class Shader {
	import std.string;
	private __gshared const vSource = `#version 330 core
		layout (location = 0) in vec2 a_position;
		out vec2 uv;

		void main() {
			gl_Position = vec4(a_position, 0.0, 1.0);
			uv = a_position * 0.5 + 0.5;
		}
	`;
	private __gshared const Radian[] positions = [
		-1, -1,  1, -1,  -1,  1,  // first triangle
		-1,  1,  1, -1,   1,  1   // second triangle
	];
	private __gshared GLuint vao;
	private __gshared GLuint posBuffer;

	private GLuint program;
	private GLint posLoc;

	private GLuint compile (string source, GLuint type) {
		GLuint shader = glCreateShader(type);
		if (!shader) throw new Exception("Failed to create new shader");
		auto str = toStringz(source);
		glShaderSource(shader, 1, &str, null);
		glCompileShader(shader);

		GLint ok = GL_FALSE;
		glGetShaderiv(shader, GL_COMPILE_STATUS, &ok);
		if (!ok) {
			GLchar[1024] info;
			GLsizei len = 0;
			glGetShaderInfoLog(shader, info.length, &len, info.ptr);
			throw new Exception("Shader compile failed:\n" ~ cast(string) info[0 .. len]);
		}
		return shader;
	}

	private void link (GLuint vs, GLuint fs) {
		program = glCreateProgram();
		glAttachShader(program, vs);
		glAttachShader(program, fs);
		glLinkProgram(program);

		GLint ok = GL_FALSE;
		glGetProgramiv(program, GL_LINK_STATUS, &ok);
		if (!ok) {
			GLchar[1024] info;
			GLsizei len = 0;
			glGetProgramInfoLog(program, info.length, &len, info.ptr);
			throw new Exception("Shader link failed:\n" ~ cast(string) info[0 .. len]);
		}
	}

	this (string fragmentShader) {
		auto vs = compile(Shader.vSource, GL_VERTEX_SHADER);
		auto fs = compile(fragmentShader, GL_FRAGMENT_SHADER);
		link(vs, fs);
		posLoc = glGetAttribLocation(program, toStringz("a_position"));

		glGenVertexArrays(1, &Shader.vao);
		glGenBuffers(1, &Shader.posBuffer);
	}

	private void delegate(int*)[] feeders;

	public Uniform!T uniform (T) (string name, T cache = T.init) {
		GLint location = glGetUniformLocation(program, toStringz(name));
		if (location < 0) throw new Exception("Uniform "~name~" not found");
		Uniform!T u = new Uniform!(T)(name, location, cache);
		feeders ~= (int* i) => u.upload(i);
		return u;
	}

	public GLint address (string name) {
		GLint location = glGetUniformLocation(program, toStringz(name));
		if (location < 0) throw new Exception("Uniform "~name~" not found");
		return location;
	}

	public void hook (void delegate (int*) feeder) {
		feeders ~= feeder;
	}

	public void use () {
		glDisable(GL_BLEND);
		glUseProgram(program);
		glBindVertexArray(Shader.vao);
		glBindBuffer(GL_ARRAY_BUFFER, Shader.posBuffer);
		glBufferData(GL_ARRAY_BUFFER, Shader.positions.length * Radian.sizeof, Shader.positions.ptr, GL_STATIC_DRAW);
		glEnableVertexAttribArray(cast (GLuint) posLoc);
		glVertexAttribPointer(cast (GLuint) posLoc, 2, GL_FLOAT, GL_FALSE, 0, null);
	}

	public void draw (Texture target, Vector4 area) {
		if (area.z <= Radian.zero || area.w <= Radian.zero) return;
		Vector2 size;
		if (target is null) {
			glBindFramebuffer(GL_FRAMEBUFFER, 0);
			size.x = Texture.screen.size.x;
			size.y = Texture.screen.size.y;
		} else {
			target.use();
			size.x = target.size.x;
			size.y = target.size.y;
		}
		glEnable(GL_SCISSOR_TEST);

		import std.math : floor, ceil;
		glScissor(
			cast (GLint) area.x.floor.raw,
			cast (GLint) area.y.floor.raw,
			cast (GLsizei) area.z.ceil.raw,
			cast (GLsizei) area.w.ceil.raw,
		);
		glViewport(0, 0, cast (GLsizei) size.x.ceil.raw, cast (GLsizei) size.y.ceil.raw);
		use();
		int texUnit = 0;
		foreach (void delegate(int*) feeder; feeders) feeder(&texUnit);
		glDrawArrays(GL_TRIANGLES, 0, 6);
	}
}
