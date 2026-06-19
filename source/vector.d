module vector;

public alias Vector = float;
public enum Vector zero = Vector(0);
public enum Vector one = Vector(1);

public struct Vector2 {
	public static enum Vector2 zero = Vector2(0, 0);
	public static enum Vector2 one = Vector2(1, 1);
	
	Vector x = Vector(0);
	Vector y = Vector(0);

	this (X, Y) (X xi = 0, Y yi = 0) {
		x = Vector(xi);
		y = Vector(yi);
	}

	Vector length () const {
		import std.math;
		return sqrt(x*x + y*y);
	}

	Vector2 normalize () const {
		if (!x && !y) return Vector2(0, 0);
		Vector len = length();
		return Vector2(x / len, y / len);
	}

	Vector2 opBinary (string op) (Vector scalar) {
		return Vector2(
			mixin("x " ~ op ~ " scalar"),
			mixin("y " ~ op ~ " scalar"),
		);
	}

	Vector2 opBinary (string op) (Vector2 rhs) {
		return Vector2(
			mixin("x " ~ op ~ " rhs.x"),
			mixin("y " ~ op ~ " rhs.y"),
		);
	}

	void opOpAssign (string op) (Vector2 rhs) {
		mixin("x " ~ op ~ "= rhs.x;");
		mixin("y " ~ op ~ "= rhs.y;");
	}

	void opOpAssign (string op) (Vector scalar) {
		mixin("x " ~ op ~ "= scalar;");
		mixin("y " ~ op ~ "= scalar;");
	}

	Vector2 opUnary (string op) () const {
		mixin("return Vector2("~op~"x, "~op~"y);");
	}

	string toString () const @safe pure {
		import std.format;
		return format("Vector2(%s, %s)", x, y);
	}

	Vector cross (Vector2 rhs) const {
		return x * rhs.y - y * rhs.x;
	}
}

public struct Vector3 {
	public static enum Vector3 zero = Vector3(0, 0, 0);
	public static enum Vector3 one = Vector3(1, 1, 1);

	Vector x = Vector(0);
	Vector y = Vector(0);
	Vector z = Vector(0);

	this (X, Y, Z) (X xi = 0, Y yi = 0, Z zi = 0) {
		this.x = Vector(xi);
		this.y = Vector(yi);
		this.z = Vector(zi);
	}

	alias r = x;
	alias g = y;
	alias b = z;

	Vector length () const {
		import std.math;
		return sqrt(x*x + y*y + z*z);
	}

	Vector3 normalize () const {
		if (!x && !y && !z) return Vector3(0, 0, 0);
		Vector len = length();
		return Vector3(x / len, y / len, z / len);
	}

	Vector3 opBinary (string op) (Vector scalar) {
		return Vector3(
			mixin("x " ~ op ~ " scalar"),
			mixin("y " ~ op ~ " scalar"),
			mixin("z " ~ op ~ " scalar"),
		);
	}

	Vector3 opBinary (string op) (Vector3 rhs) {
		return Vector3(
			mixin("x " ~ op ~ " rhs.x"),
			mixin("y " ~ op ~ " rhs.y"),
			mixin("z " ~ op ~ " rhs.z"),
		);
	}

	void opOpAssign (string op) (Vector3 rhs) {
		mixin("x " ~ op ~ "= rhs.x;");
		mixin("y " ~ op ~ "= rhs.y;");
		mixin("z " ~ op ~ "= rhs.z;");
	}

	void opOpAssign (string op) (Vector scalar) {
		mixin("x " ~ op ~ "= scalar;");
		mixin("y " ~ op ~ "= scalar;");
		mixin("z " ~ op ~ "= scalar;");
	}

	Vector3 opUnary (string op) () const {
		mixin("return Vector3("~op~"x, "~op~"y, "~op~"z);");
	}
	
	string toString () const @safe pure {
		import std.format;
		return format("Vector3(%s, %s, %s)", x, y, z);
	}

	Vector3 cross (Vector3 rhs) const {
		return Vector3(
			y * rhs.z - z * rhs.y,
			z * rhs.x - x * rhs.z,
			x * rhs.y - y * rhs.x
		);
	}
}

public struct Vector4 {
	public static enum Vector4 zero = Vector4(0, 0, 0, 0);
	public static enum Vector4 one = Vector4(1, 1, 1, 1);

	Vector x = Vector(0);
	Vector y = Vector(0);
	Vector z = Vector(0);
	Vector w = Vector(0);

	this (X, Y, Z, W) (X xi = 0, Y yi = 0, Z zi = 0, W wi = 0) {
		this.x = Vector(xi);
		this.y = Vector(yi);
		this.z = Vector(zi);
		this.w = Vector(wi);
	}

	alias r = x;
	alias g = y;
	alias b = z;
	alias a = w;

	Vector length () const {
		import std.math;
		return sqrt(x*x + y*y + z*z + w*w);
	}

	Vector4 normalize () const {
		if (!x && !y && !z && !w) return Vector4(0, 0, 0, 0);
		Vector len = length();
		return Vector4(x / len, y / len, z / len, w / len);
	}

	alias i = x;
	alias j = y;
	alias k = z;

	Vector4 opBinary (string op) (Vector scalar) {
		return Vector4(
			mixin("x " ~ op ~ " scalar"),
			mixin("y " ~ op ~ " scalar"),
			mixin("z " ~ op ~ " scalar"),
			mixin("w " ~ op ~ " scalar"),
		);
	}

	Vector4 opBinary (string op) (Vector4 rhs) {
		return Vector4(
			mixin("x " ~ op ~ " rhs.x"),
			mixin("y " ~ op ~ " rhs.y"),
			mixin("z " ~ op ~ " rhs.z"),
			mixin("w " ~ op ~ " rhs.w"),
		);
	}

	Vector4 opBinary (string op) (Vector2 rhs) {
		return Vector4(
			mixin("x " ~ op ~ " rhs.x"),
			mixin("y " ~ op ~ " rhs.y"),
			mixin("z " ~ op ~ " rhs.x"),
			mixin("w " ~ op ~ " rhs.y"),
		);
	}

	void opOpAssign (string op) (Vector4 rhs) {
		mixin("x " ~ op ~ "= rhs.x;");
		mixin("y " ~ op ~ "= rhs.y;");
		mixin("z " ~ op ~ "= rhs.z;");
		mixin("w " ~ op ~ "= rhs.w;");
	}

	void opOpAssign (string op) (Vector2 rhs) {
		mixin("x " ~ op ~ "= rhs.x;");
		mixin("y " ~ op ~ "= rhs.y;");
		mixin("z " ~ op ~ "= rhs.x;");
		mixin("w " ~ op ~ "= rhs.y;");
	}

	void opOpAssign (string op) (Vector scalar) {
		mixin("x " ~ op ~ "= scalar;");
		mixin("y " ~ op ~ "= scalar;");
		mixin("z " ~ op ~ "= scalar;");
		mixin("w " ~ op ~ "= scalar;");
	}

	Vector4 opUnary (string op) () const {
		mixin("return Vector4("~op~"x, "~op~"y, "~op~"z, "~op~"w);");
	}

	string toString () const @safe pure {
		import std.format;
		return format("Vector4(%s, %s, %s, %s)", x, y, z, w);
	}

	Vector4 cross (Vector4 rhs) const {
		return Vector4(
			y * rhs.z - z * rhs.y,
			z * rhs.x - x * rhs.z,
			x * rhs.y - y * rhs.x,
			0.0f
		);
	}

	/// Quaternion product (real part = w, imaginary part = (i,j,k))
	Vector4 quatProd (Vector4 rhs) const {
		return Vector4(
			// i component
			w * rhs.i + i * rhs.w + j * rhs.k - k * rhs.j,
			// j component
			w * rhs.j - i * rhs.k + j * rhs.w + k * rhs.i,
			// k component
			w * rhs.k + i * rhs.j - j * rhs.i + k * rhs.w,
			// w component (real part)
			w * rhs.w - i * rhs.i - j * rhs.j - k * rhs.k
		);
	}
}
