module vector;

public import std.math;
public import std.algorithm;

public struct Radian {
	private static enum float factor = 180 / PI;
	public static enum Radian zero = Radian(0);
	public static enum Radian one = Radian(1);
	public static enum Radian two = Radian(2);
	public static enum Radian pi = Radian(PI);
	public static enum Radian e = Radian(E);
	public static enum Radian epsilon = Radian(float.epsilon);
	public static enum Radian infinity = Radian(float.infinity);
	public static enum Radian nan = Radian(float.nan);
	public static enum Radian v_max = Radian(float.max);
	public static enum Radian v_max_10_exp = Radian(float.max_10_exp);
	public static enum Radian v_max_exp = Radian(float.max_exp);
	public static enum Radian v_min_10_exp = Radian(float.min_10_exp);
	public static enum Radian v_min_exp = Radian(float.min_exp);
	public static enum Radian v_min_normal = Radian(float.min_normal);
	
	private float data = 0;
	pragma(inline, true) public this (T) (T d) const @safe pure nothrow @nogc if (!is(T == Degree)) { data = cast(float)(d); }
	pragma(inline, true) public @property Degree deg () const @safe pure nothrow @nogc { return Degree(data * factor).normalized; }
	pragma(inline, true) public @property float raw () const @safe pure nothrow @nogc { return data; }
	pragma(inline, true) public Radian opBinary (string op) (Radian rhs) const @safe pure nothrow @nogc { return Radian(mixin("data"~op~"rhs.raw")); }
	pragma(inline, true) public Radian opOpAssign (string op) (Radian rhs) @safe pure nothrow @nogc { data = mixin("data"~op~"rhs.raw"); return this; }
	pragma(inline, true) public Radian opUnary (string op : "-") () const @safe pure nothrow @nogc { return Radian(mixin(op~"data")); }
	pragma(inline, true) public @property Radian abs () const @safe pure nothrow @nogc { return Radian(std.math.abs(data)); }
	pragma(inline, true) public @property Radian sqrt () const @safe pure nothrow @nogc { return Radian(std.math.sqrt(data)); }
	pragma(inline, true) public Radian pow (Radian power) const @safe pure nothrow @nogc { return Radian(std.math.pow(data, power.raw)); }
	pragma(inline, true) public @property Radian sin () const @safe pure nothrow @nogc { return Radian(std.math.sin(data)); }
	pragma(inline, true) public @property Radian cos () const @safe pure nothrow @nogc { return Radian(std.math.cos(data)); }
	pragma(inline, true) public @property Radian tan () const @safe pure nothrow @nogc { return Radian(std.math.tan(data)); }
	pragma(inline, true) public Radian min (Radian other) const @safe pure nothrow @nogc { return Radian(std.algorithm.min(data, other.raw)); }
	pragma(inline, true) public Radian max (Radian other) const @safe pure nothrow @nogc { return Radian(std.algorithm.max(data, other.raw)); }
	pragma(inline, true) public Radian mix (Radian other, Radian v) const @safe pure nothrow @nogc { return Radian(this * (Radian.one - v) + other * v); }
	pragma(inline, true) public Radian clamp (Radian b, Radian t) const @safe pure nothrow @nogc { return Radian(std.algorithm.clamp(data, b.raw, t.raw)); }
	pragma(inline, true) public @property Radian ceil () const @safe pure nothrow @nogc { return Radian(std.math.ceil(data)); }
	pragma(inline, true) public @property Radian floor () const @safe pure nothrow @nogc { return Radian(std.math.floor(data)); }
	pragma(inline, true) public @property Radian invert () const @safe pure nothrow @nogc { return Radian(1 / data); }
	pragma(inline, true) public bool opEquals (Radian other) const @safe pure nothrow @nogc { return other.raw == data; }
	pragma(inline, true) public int opCmp (Radian other) const @safe pure nothrow @nogc { return (data > other.raw) ? (1) : ((data < other.raw) ? (-1) : (0)); }
	pragma(inline, true) public T opCast (T) () const @safe pure nothrow @nogc {
		static if (is(T == float)) return raw;
		return cast (T) raw;
	}
	debug public string toString() const @safe pure { import std.format; return format("Radian(%s)", data); }
}

public struct Degree {
	private static enum float factor = PI / 180;
	public static enum Degree zero = Degree(0);
	public static enum Degree one = Degree(1);
	public static enum Degree two = Degree(2);

	private float data = 0;
	pragma(inline, true) public this (T) (T d) const @safe pure nothrow @nogc if (!is(T == Radian)) { data = normalize(d); }
	pragma(inline, true) public @property Radian rad () const @safe pure nothrow @nogc { return Radian(normalized.raw * factor % (2 * PI)); }
	pragma(inline, true) public @property float raw () const @safe pure nothrow @nogc { return data; }
	pragma(inline, true) public Degree opBinary (string op) (Degree rhs) const @safe pure nothrow @nogc { return Degree(mixin("data"~op~"rhs.raw")); }
	pragma(inline, true) public Degree opOpAssign (string op) (Degree rhs) @safe pure nothrow @nogc { data = normalize(mixin("data"~op~"rhs.raw")); return this; }
	pragma(inline, true) public Degree opUnary (string op : "-") () const @safe pure nothrow @nogc { return Degree(mixin(op~"data")); }
	pragma(inline, true) public @property Vector2 direction () const @safe pure nothrow @nogc { return Vector2(rad.cos, rad.sin); }
	pragma(inline, true) public @property Degree abs () const @safe pure nothrow @nogc { return Degree(std.math.abs(data)); }
	pragma(inline, true) public @property Degree sqrt () const @safe pure nothrow @nogc { return Degree(std.math.sqrt(data)); }
	pragma(inline, true) public Degree pow (Degree power) const @safe pure nothrow @nogc { return Degree(std.math.pow(data, power.raw)); }
	pragma(inline, true) public Degree min (Degree other) const @safe pure nothrow @nogc { return Degree(std.algorithm.min(data, other.raw)); }
	pragma(inline, true) public Degree max (Degree other) const @safe pure nothrow @nogc { return Degree(std.algorithm.max(data, other.raw)); }
	pragma(inline, true) public Degree mix (Degree other, Radian v) const @safe pure nothrow @nogc { return (this.direction() * (Radian(1) - v) + other.direction() * v).angle; }
	pragma(inline, true) public @property Degree clamp (Degree b, Degree t) const @safe pure nothrow @nogc { return Degree(std.algorithm.clamp(data, b.raw, t.raw)); }
	pragma(inline, true) public @property Degree ceil () const @safe pure nothrow @nogc { return Degree(std.math.ceil(data)); }
	pragma(inline, true) public @property Degree floor () const @safe pure nothrow @nogc { return Degree(std.math.floor(data)); }
	pragma(inline, true) private float normalize (float v) const @safe pure nothrow @nogc { return (360 + (v % 360)) % 360; }
	pragma(inline, true) public @property Degree normalized () const @safe pure nothrow @nogc { return Degree((360 + (data % 360)) % 360); }
	pragma(inline, true) public @property Degree invert () const @safe pure nothrow @nogc { return this + Degree(180); }
	pragma(inline, true) public bool opEquals (Degree other) const @safe pure nothrow @nogc { return other.raw == data; }
	pragma(inline, true) public int opCmp (Degree other) const @safe pure nothrow @nogc { return (data > other.raw) ? (1) : ((data < other.raw) ? (-1) : (0)); }
	debug public string toString() const @safe pure { import std.format; return format("Degree(%s)", data); }
	pragma(inline, true) public T opCast (T) () const @safe pure nothrow @nogc {
		static if (is(T == float)) return raw;
		return cast (T) raw;
	}
}

public struct Vector2 {
	public static enum Vector2 zero = Vector2(Radian.zero, Radian.zero);
	public static enum Vector2 one = Vector2(Radian.one, Radian.one);
	public static enum Vector2 two = Vector2(Radian.two, Radian.two);
	public static enum Vector2 pi = Vector2(Radian.pi, Radian.pi);
	public static enum Vector2 e = Vector2(Radian.e, Radian.e);
	public static enum Vector2 epsilon = Vector2(Radian.epsilon, Radian.epsilon);
	public static enum Vector2 infinity = Vector2(Radian.infinity, Radian.infinity);
	public static enum Vector2 nan = Vector2(Radian.nan, Radian.nan);
	public static enum Vector2 v_max = Vector2(Radian.v_max, Radian.v_max);
	public static enum Vector2 v_max_10_exp = Vector2(Radian.v_max_10_exp, Radian.v_max_10_exp);
	public static enum Vector2 v_max_exp = Vector2(Radian.v_max_exp, Radian.v_max_exp);
	public static enum Vector2 v_min_10_exp = Vector2(Radian.v_min_10_exp, Radian.v_min_10_exp);
	public static enum Vector2 v_min_exp = Vector2(Radian.v_min_exp, Radian.v_min_exp);
	public static enum Vector2 v_min_normal = Vector2(Radian.v_min_normal, Radian.v_min_normal);
	
	public Radian x = Radian.zero;
	public Radian y = Radian.zero;
	
	public this (
		Radian x_,
		Radian y_,
	) const @safe pure nothrow @nogc {
		x = x_;
		y = y_;
	}

	public @property Vector2 min (Vector2 other) const @safe pure nothrow @nogc { return Vector2(x.min(other.x), y.min(other.y)); }
	public @property Vector2 max (Vector2 other) const @safe pure nothrow @nogc { return Vector2(x.max(other.x), y.max(other.y)); }
	public @property Vector2 mix (Vector2 other, Radian v) const @safe pure nothrow @nogc { return Vector2(x.mix(other.x, v), y.mix(other.y, v)); }
	public @property Vector2 clamp (Vector2 b, Vector2 t) const @safe pure nothrow @nogc { return Vector2(x.clamp(b.x, t.x), y.clamp(b.y, t.y)); }
	public @property Vector2 ceil () const @safe pure nothrow @nogc { return Vector2(x.ceil, y.ceil); }
	public @property Vector2 floor () const @safe pure nothrow @nogc { return Vector2(x.floor, y.floor); }
	public @property Vector2 invert () const @safe pure nothrow @nogc { return Vector2.one / this; }

	public @property Radian length () const @safe pure nothrow @nogc {
		return (x*x + y*y).sqrt;
	}

	public @property Vector2 normalized () const @safe pure nothrow @nogc {
		if (!x && !y) return Vector2.zero;
		return Vector2(x / length, y / length);
	}

	public @property Degree angle () const @safe pure nothrow @nogc {
		if (!x && !y) return Degree.zero;
		return Radian(atan2(y.raw, x.raw)).deg;
	}

	public Vector2 opBinary (string op) (Radian scalar) const @safe pure nothrow @nogc {
		return Vector2(
			mixin("x " ~ op ~ " scalar"),
			mixin("y " ~ op ~ " scalar"),
		);
	}

	public Vector2 opBinaryRight (string op) (Radian scalar) const @safe pure nothrow @nogc {
		return Vector2(
			mixin("scalar " ~ op ~ " x"),
			mixin("scalar " ~ op ~ " y"),
		);
	}

	public Vector2 opBinary (string op) (Vector2 rhs) const @safe pure nothrow @nogc {
		return Vector2(
			mixin("x " ~ op ~ " rhs.x"),
			mixin("y " ~ op ~ " rhs.y"),
		);
	}

	public Vector2 opOpAssign (string op) (Vector2 rhs) @safe pure nothrow @nogc {
		mixin("x " ~ op ~ "= rhs.x;");
		mixin("y " ~ op ~ "= rhs.y;");
		return this;
	}

	public Vector2 opOpAssign (string op) (Radian rad) @safe pure nothrow @nogc {
		mixin("x " ~ op ~ "= rad;");
		mixin("y " ~ op ~ "= rad;");
		return this;
	}

	public Vector2 opUnary (string op : "-") () const @safe pure nothrow @nogc {
		mixin("return Vector2("
			~op~"x,"
			~op~"y,"
		~");");
	}

	public string toString () const @safe pure {
		import std.format;
		return format("Vector2(%s, %s)", x, y);
	}

	public Radian cross (Vector2 rhs) const @safe pure nothrow @nogc {
		return x * rhs.y - y * rhs.x;
	}
}

public struct Vector3 {
	public static enum Vector3 zero = Vector3(Radian.zero, Radian.zero, Radian.zero);
	public static enum Vector3 one = Vector3(Radian.one, Radian.one, Radian.one);
	public static enum Vector3 two = Vector3(Radian.two, Radian.two, Radian.two);
	public static enum Vector3 pi = Vector3(Radian.pi, Radian.pi, Radian.pi);
	public static enum Vector3 e = Vector3(Radian.e, Radian.e, Radian.e);
	public static enum Vector3 epsilon = Vector3(Radian.epsilon, Radian.epsilon, Radian.epsilon);
	public static enum Vector3 infinity = Vector3(Radian.infinity, Radian.infinity, Radian.infinity);
	public static enum Vector3 nan = Vector3(Radian.nan, Radian.nan, Radian.nan);
	public static enum Vector3 v_max = Vector3(Radian.v_max, Radian.v_max, Radian.v_max);
	public static enum Vector3 v_max_10_exp = Vector3(Radian.v_max_10_exp, Radian.v_max_10_exp, Radian.v_max_10_exp);
	public static enum Vector3 v_max_exp = Vector3(Radian.v_max_exp, Radian.v_max_exp, Radian.v_max_exp);
	public static enum Vector3 v_min_10_exp = Vector3(Radian.v_min_10_exp, Radian.v_min_10_exp, Radian.v_min_10_exp);
	public static enum Vector3 v_min_exp = Vector3(Radian.v_min_exp, Radian.v_min_exp, Radian.v_min_exp);
	public static enum Vector3 v_min_normal = Vector3(Radian.v_min_normal, Radian.v_min_normal, Radian.v_min_normal);
	
	public Radian x = Radian.zero;
	public Radian y = Radian.zero;
	public Radian z = Radian.zero;
	
	public this (
		Radian x_,
		Radian y_,
		Radian z_,
	) const @safe pure nothrow @nogc {
		x = x_;
		y = y_;
		z = z_;
	}

	public @property Vector3 min (Vector3 other) const @safe pure nothrow @nogc { return Vector3(x.min(other.x), y.min(other.y), z.min(other.z)); }
	public @property Vector3 max (Vector3 other) const @safe pure nothrow @nogc { return Vector3(x.max(other.x), y.max(other.y), z.max(other.z)); }
	public @property Vector3 mix (Vector3 other, Radian v) const @safe pure nothrow @nogc { return Vector3(x.mix(other.x, v), y.mix(other.y, v), z.mix(other.z, v)); }
	public @property Vector3 clamp (Vector3 b, Vector3 t) const @safe pure nothrow @nogc { return Vector3(x.clamp(b.x, t.x), y.clamp(b.y, t.y), z.clamp(b.z, t.z)); }
	public @property Vector3 ceil () const @safe pure nothrow @nogc { return Vector3(x.ceil, y.ceil, z.ceil); }
	public @property Vector3 floor () const @safe pure nothrow @nogc { return Vector3(x.floor, y.floor, z.floor); }
	public @property Vector3 invert () const @safe pure nothrow @nogc { return Vector3.one / this; }

	public @property Radian length () const @safe pure nothrow @nogc {
		return (x*x + y*y + z*z).sqrt;
	}

	public @property Vector3 normalized () const @safe pure nothrow @nogc {
		if (!x && !y && !z) return Vector3.zero;
		return Vector3(x / length, y / length, z / length);
	}

	public Vector3 opBinary (string op) (Radian scalar) const @safe pure nothrow @nogc {
		return Vector3(
			mixin("x " ~ op ~ " scalar"),
			mixin("y " ~ op ~ " scalar"),
			mixin("z " ~ op ~ " scalar"),
		);
	}

	public Vector3 opBinaryRight (string op) (Radian scalar) const @safe pure nothrow @nogc {
		return Vector3(
			mixin("scalar " ~ op ~ " x"),
			mixin("scalar " ~ op ~ " y"),
			mixin("scalar " ~ op ~ " z"),
		);
	}

	public Vector3 opBinary (string op) (Vector3 rhs) const @safe pure nothrow @nogc {
		return Vector3(
			mixin("x " ~ op ~ " rhs.x"),
			mixin("y " ~ op ~ " rhs.y"),
			mixin("z " ~ op ~ " rhs.z"),
		);
	}

	public Vector3 opOpAssign (string op) (Vector3 rhs) @safe pure nothrow @nogc {
		mixin("x " ~ op ~ "= rhs.x;");
		mixin("y " ~ op ~ "= rhs.y;");
		mixin("z " ~ op ~ "= rhs.z;");
		return this;
	}

	public Vector3 opOpAssign (string op) (Radian rad) @safe pure nothrow @nogc {
		mixin("x " ~ op ~ "= rad;");
		mixin("y " ~ op ~ "= rad;");
		mixin("z " ~ op ~ "= rad;");
		return this;
	}

	public Vector3 opUnary (string op : "-") () const @safe pure nothrow @nogc {
		mixin("return Vector3("
			~op~"x,"
			~op~"y,"
			~op~"z,"
		~");");
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
	public static enum Vector4 zero = Vector4(Radian.zero, Radian.zero, Radian.zero, Radian.zero);
	public static enum Vector4 one = Vector4(Radian.one, Radian.one, Radian.one, Radian.one);
	public static enum Vector4 two = Vector4(Radian.two, Radian.two, Radian.two, Radian.two);
	public static enum Vector4 pi = Vector4(Radian.pi, Radian.pi, Radian.pi, Radian.pi);
	public static enum Vector4 e = Vector4(Radian.e, Radian.e, Radian.e, Radian.e);
	public static enum Vector4 epsilon = Vector4(Radian.epsilon, Radian.epsilon, Radian.epsilon, Radian.epsilon);
	public static enum Vector4 infinity = Vector4(Radian.infinity, Radian.infinity, Radian.infinity, Radian.infinity);
	public static enum Vector4 infinityR = Vector4(Radian.infinity, Radian.infinity, -Radian.infinity, -Radian.infinity);
	public static enum Vector4 nan = Vector4(Radian.nan, Radian.nan, Radian.nan, Radian.nan);
	public static enum Vector4 v_max = Vector4(Radian.v_max, Radian.v_max, Radian.v_max, Radian.v_max);
	public static enum Vector4 v_max_10_exp = Vector4(Radian.v_max_10_exp, Radian.v_max_10_exp, Radian.v_max_10_exp, Radian.v_max_10_exp);
	public static enum Vector4 v_max_exp = Vector4(Radian.v_max_exp, Radian.v_max_exp, Radian.v_max_exp, Radian.v_max_exp);
	public static enum Vector4 v_min_10_exp = Vector4(Radian.v_min_10_exp, Radian.v_min_10_exp, Radian.v_min_10_exp, Radian.v_min_10_exp);
	public static enum Vector4 v_min_exp = Vector4(Radian.v_min_exp, Radian.v_min_exp, Radian.v_min_exp, Radian.v_min_exp);
	public static enum Vector4 v_min_normal = Vector4(Radian.v_min_normal, Radian.v_min_normal, Radian.v_min_normal, Radian.v_min_normal);
	
	public Radian x = Radian.zero;
	public Radian y = Radian.zero;
	public Radian z = Radian.zero;
	public Radian w = Radian.zero;
	
	public this (
		Radian x_,
		Radian y_,
		Radian z_,
		Radian w_,
	) const @safe pure nothrow @nogc {
		x = x_;
		y = y_;
		z = z_;
		w = w_;
	}

	public @property Vector4 min (Vector4 other) const @safe pure nothrow @nogc { return Vector4(x.min(other.x), y.min(other.y), z.min(other.z), w.min(other.w)); }
	public @property Vector4 max (Vector4 other) const @safe pure nothrow @nogc { return Vector4(x.max(other.x), y.max(other.y), z.max(other.z), w.max(other.w)); }
	public @property Vector4 mix (Vector4 other, Radian v) const @safe pure nothrow @nogc { return Vector4(x.mix(other.x, v), y.mix(other.y, v), z.mix(other.z, v), w.mix(other.w, v)); }
	public @property Vector4 clamp (Vector4 b, Vector4 t) const @safe pure nothrow @nogc { return Vector4(x.clamp(b.x, t.x), y.clamp(b.y, t.y), z.clamp(b.z, t.z), w.clamp(b.w, t.w)); }
	public @property Vector4 ceil () const @safe pure nothrow @nogc { return Vector4(x.ceil, y.ceil, z.ceil, w.ceil); }
	public @property Vector4 floor () const @safe pure nothrow @nogc { return Vector4(x.floor, y.floor, z.floor, w.floor); }
	public @property Vector4 invert () const @safe pure nothrow @nogc { return Vector4.one / this; }

	public @property Radian length () const @safe pure nothrow @nogc {
		return (x*x + y*y + z*z + w*w).sqrt;
	}

	public @property Vector4 normalized () const @safe pure nothrow @nogc {
		if (!x && !y && !z && !w) return Vector4.zero;
		return Vector4(x / length, y / length, z / length, w / length);
	}

	public Vector4 opBinary (string op) (Radian scalar) const @safe pure nothrow @nogc {
		return Vector4(
			mixin("x " ~ op ~ " scalar"),
			mixin("y " ~ op ~ " scalar"),
			mixin("z " ~ op ~ " scalar"),
			mixin("w " ~ op ~ " scalar"),
		);
	}

	public Vector4 opBinaryRight (string op) (Radian scalar) const @safe pure nothrow @nogc {
		return Vector4(
			mixin("scalar " ~ op ~ " x"),
			mixin("scalar " ~ op ~ " y"),
			mixin("scalar " ~ op ~ " z"),
			mixin("scalar " ~ op ~ " w"),
		);
	}

	public Vector4 opBinary (string op) (Vector4 rhs) const @safe pure nothrow @nogc {
		return Vector4(
			mixin("x " ~ op ~ " rhs.x"),
			mixin("y " ~ op ~ " rhs.y"),
			mixin("z " ~ op ~ " rhs.z"),
			mixin("w " ~ op ~ " rhs.w"),
		);
	}

	public Vector4 opOpAssign (string op) (Vector4 rhs) @safe pure nothrow @nogc {
		mixin("x " ~ op ~ "= rhs.x;");
		mixin("y " ~ op ~ "= rhs.y;");
		mixin("z " ~ op ~ "= rhs.z;");
		mixin("w " ~ op ~ "= rhs.w;");
		return this;
	}

	public Vector4 opOpAssign (string op) (Radian rad) @safe pure nothrow @nogc {
		mixin("x " ~ op ~ "= rad;");
		mixin("y " ~ op ~ "= rad;");
		mixin("z " ~ op ~ "= rad;");
		mixin("w " ~ op ~ "= rad;");
		return this;
	}

	public Vector4 opUnary (string op : "-") () const @safe pure nothrow @nogc {
		mixin("return Vector4("
			~op~"x,"
			~op~"y,"
			~op~"z,"
			~op~"w,"
		~");");
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
			Radian.zero,
		);
	}

	public alias i = x;
	public alias j = y;
	public alias k = z;
	
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

public struct CubicBezier {
	Vector2 p0;
	Vector2 p1;
	Vector2 p2;
	Vector2 p3;
}
