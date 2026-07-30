module bismuth.framework.dkernel;

import bismuth;
import bindbc.opengl;

public import std.math : sin, cos, tan, atan, PI, PI_2, PI_4, E;
public import std.algorithm : min, max;

private string ext (T) (ulong S = 1) {
	import std.conv : to;
	static if (is(T == bool)) return "bool";
	else static if (is(T == int)) return "int";
	else static if (is(T == Vector)) return "float";
	else static if (is(T == Vector2)) return "vec2";
	else static if (is(T == Vector3)) return "vec3";
	else static if (is(T == Vector4)) return "vec4";
	else static if (is(T == Texture)) return "sampler2D";
	else static if (is(T == bool[])) return "bool["~to!string(S)~"]";
	else static if (is(T == int[])) return "int["~to!string(S)~"]";
	else static if (is(T == Vector[])) return "float["~to!string(S)~"]";
	else static if (is(T == Vector2[])) return "vec2["~to!string(S)~"]";
	else static if (is(T == Vector3[])) return "vec3["~to!string(S)~"]";
	else static if (is(T == Vector4[])) return "vec4["~to!string(S)~"]";
	else static if (is(T == Texture[])) return "sampler2D["~to!string(S)~"]";
	else static assert(false);
}



class KernelStored (T) {
	alias ElementType = T;
	Kernel kernel;
	string name;
	ulong arrayLength = 1;

	mixin KernelExpressions;

	this (Kernel _kernel = null, string _name = "", ulong _arrayLength = 1) {
		kernel = _kernel; name = _name; arrayLength = _arrayLength;
		name = (_name == "") ? kernel.genName() : _name;
	}
}

private template PromoteTypes(A, B) {
	static if (is(A == B))
		alias PromoteTypes = A;
	else static if (is(A == Vector) && (is(B == Vector2) || is(B == Vector3) || is(B == Vector4)))
		alias PromoteTypes = B;
	else static if ((is(A == Vector2) || is(A == Vector3) || is(A == Vector4)) && is(B == Vector))
		alias PromoteTypes = A;
	else
		static assert(false, "Cannot promote " ~ A.stringof ~ " and " ~ B.stringof);
}

private mixin template KernelExpressions () {
	// Assumes the surrounding class has a template parameter T,
	// fields `kernel`, `name`, `arrayLength`

	public auto opBinary (string op, V) (V v) if (isStoredOrLiteral!(ElementTypeFromArg!V, V)) {
		alias ResultType = PromoteTypes!(T, ElementTypeFromArg!V);
		auto _v = kernel.asKernelStored!(ElementTypeFromArg!V)(v);
		KernelStored!ResultType ks = new KernelStored!ResultType(kernel);
		kernel.main ~= ext!(ResultType)() ~ " " ~ ks.name ~ "=" ~ name ~ op ~ _v.name ~ ";";
		return ks;
	}

	public auto opBinaryRight (string op, V) (V v) if (isStoredOrLiteral!(ElementTypeFromArg!V, V)) {
		alias ResultType = PromoteTypes!(ElementTypeFromArg!V, T);
		auto _v = kernel.asKernelStored!(ElementTypeFromArg!V)(v);
		KernelStored!ResultType ks = new KernelStored!ResultType(kernel);
		kernel.main ~= ext!(ResultType)() ~ " " ~ ks.name ~ "=" ~ _v.name ~ op ~ name ~ ";";
		return ks;
	}

	public KernelStored!R component (string c, R = ComponentToType!c) () if (validComponent!T(c) && validComponentExtract!(T, R)) {
		KernelStored!R ks = new KernelStored!R(kernel);
		kernel.main ~= ext!(R)()~" "~ks.name~"="~name~"."~c~";";
		return ks;
	}

	public KernelStored!U opIndex (U, A) (A index) if (isStoredOrLiteral!(int, A) && is(T == U[])) {
		auto _index = kernel.asKernelStored!(ElementTypeFromArg!A)(index);
		KernelStored!U ks = new KernelStored!U(kernel);
		kernel.main ~= ext!(U)()~" "~ks.name~"="~name~"["~_index.name~"];";
		return ks;
	}

	public KernelStored!U opIndexAssign (U, A, B) (B data, A index) if (isStoredOrLiteral!(int, A) && is(T == U[]) && isStoredOrLiteral!(ElementTypeFromArg!B, B) && is(ElementTypeFromArg!B) == U) {
		auto _index = kernel.asKernelStored!(ElementTypeFromArg!A)(index);
		auto _v = kernel.asKernelStored!(ElementTypeFromArg!B)(data);
		kernel.main ~= name~"["~_index.name~"]="~_v~";";
		return _v;
	}
}


class KernelParameter (T) : KernelStored!T {
	alias ElementType = T;
	public Uniform!T uniform;

	this (Kernel _kernel = null, string _name = "", ulong _arrayLength = 1) {
		super(_kernel, _name, _arrayLength);
	}

	this (Kernel _kernel = null, ulong _arrayLength = 1, string _name = "") {
		super(_kernel, _name, _arrayLength);
	}

	void set (T t) { uniform.set(t); }
}

private enum isKernelExpression(E) = is(typeof(E) : KernelStored!(E.ElementType));

private template ComponentToType (string c) {
	static if (c.length == 1) alias ComponentToType = Vector;
	else static if (c.length == 2) alias ComponentToType = Vector2;
	else static if (c.length == 3) alias ComponentToType = Vector3;
	else static if (c.length == 4) alias ComponentToType = Vector4;
	else static assert(false);
}

private template validComponentExtract (S, R) {
	enum validComponentExtract = false
	|| (is(S == Vector4) && (is(R == Vector4) || is(R == Vector3) || is(R == Vector2) || is(R == Vector)))
	|| (is(S == Vector3) && (is(R == Vector3) || is(R == Vector2) || is(R == Vector)))
	|| (is(S == Vector2) && (is(R == Vector2) || is(R == Vector)))
	;
}

private string[] validComponents(T)() if (KernelComponentBased!T) {
	import std.algorithm : canFind;
	static if (is(T == Vector2)) return ["xy","x","y","rg","r","g"];
	else static if (is(T == Vector3)) return ["xyz","xy","yz","x","y","z","rgb","rg","gb","r","g","b"];
	else static if (is(T == Vector4)) return [
		"xyzw","xyz","yzw","xy","yz","zw","x","y","z","w",
		"rgba","rgb","gba","rg","gb","ba","r","g","b","a",
	];
	else static assert(false);
}

private bool validComponent(T)(string component) if (KernelComponentBased!T) {
	import std.algorithm : canFind;
	return canFind(validComponents!T, component);
}

private enum isStoredOrLiteral(T, V) = is(V : KernelStored!T) || (KernelLiteral!T && is(V : T));
private template ElementTypeFromArg(V) {
	static if (is(V : KernelStored!U, U)) alias ElementTypeFromArg = U;
	else static if (KernelLiteral!V) alias ElementTypeFromArg = V;
	else static assert(0, "Unsupported type: " ~ V.stringof);
}

public class Kernel {
	private int nameCount = 0;
	public string genName () {
		import std.conv;
		return "_dkernel"~to!string(nameCount++);
	}

	private string setupCompose = "";
	private string main = "";
	private void delegate(GLint)[string] lateUniformUpdate;
	private void delegate(int*)[string] upload;
	private Shader shader;
	
	public KernelStored!Vector4 coord;
	public KernelStored!Vector2 uv;
	
	public KernelStored!Vector E;
	public KernelStored!Vector PI;
	public KernelStored!Vector EPS;
	
	public this () {
		coord = new KernelStored!Vector4(this, "gl_FragCoord");
		uv = new KernelStored!Vector2(this, "uv");
		import std.math;
		PI = literal(Vector(std.math.PI));
		EPS = literal(Vector(0).epsilon);
		E = literal(Vector(std.math.E));
	}
	public static Kernel create () { return new Kernel(); }
	this (void delegate (Kernel) setup) { this(); setup(this); }
	public static Kernel create (void delegate (Kernel) setup) { return new Kernel(setup); }
	public void compute (void delegate (Kernel) setup) { setup(this); }

	void draw (Texture target, Vector4 area) {
		if (shader is null) build();
		shader.draw(target, area);
	}

	KernelParameter!T uniform (T) (ulong arrayLength = 1) {
		KernelParameter!T ku = new KernelParameter!T(this, arrayLength);
		ku.uniform = new Uniform!T(ku.name, 0, T.init);
		setupCompose ~= "uniform "~ext!T(arrayLength)~" "~ku.uniform.name~";";
		lateUniformUpdate[ku.uniform.name] = (GLint i) { ku.uniform.location = i; };
		upload[ku.uniform.name] = (int* i) => ku.uniform.upload(i);
		return ku;
	}

	public KernelStored!T literal (T) (T literal) if (KernelLiteral!T) {
		KernelStored!T ks = new KernelStored!T(this, genName());
		setupCompose ~= "const "~ext!(T)()~" "~ks.name~"="~serialize!T(literal)~";";
		return ks;
	}

	public KernelStored!T array (T) (ulong arraySize) if (KernelLiteral!T) {
		KernelStored!T ks = new KernelStored!T(this, genName(), arraySize);
		main ~= ext!(T)(arraySize)~" "~ks.name~";";
		return ks;
	}

	public KernelStored!Vector2 compose (A, B) (A a, B b) if (isStoredOrLiteral!(Vector, A) && isStoredOrLiteral!(Vector, B)) { alias T = Vector2; auto _a = asKernelStored!Vector(a); auto _b = asKernelStored!Vector(b); KernelStored!T ks = new KernelStored!T(this); main ~= ext!T()~" "~ks.name~"=vec2("~_a.name~","~_b.name~");"; return ks; }
	public KernelStored!Vector3 compose (A, B, C) (A a, B b, C c) if (isStoredOrLiteral!(Vector, A) && isStoredOrLiteral!(Vector, B) && isStoredOrLiteral!(Vector, C)) { alias T = Vector3; auto _a = asKernelStored!Vector(a); auto _b = asKernelStored!Vector(b); auto _c = asKernelStored!Vector(c); KernelStored!T ks = new KernelStored!T(this); main ~= ext!T()~" "~ks.name~"=vec3("~_a.name~","~_b.name~","~_c.name~");"; return ks; }
	public KernelStored!Vector4 compose (A, B, C, D) (A a, B b, C c, D d) if (isStoredOrLiteral!(Vector, A) && isStoredOrLiteral!(Vector, B) && isStoredOrLiteral!(Vector, C) && isStoredOrLiteral!(Vector, D)) { alias T = Vector4; auto _a = asKernelStored!Vector(a); auto _b = asKernelStored!Vector(b); auto _c = asKernelStored!Vector(c); auto _d = asKernelStored!Vector(d); KernelStored!T ks = new KernelStored!T(this); main ~= ext!T()~" "~ks.name~"=vec4("~_a.name~","~_b.name~","~_c.name~","~_d.name~");"; return ks; }
	public KernelStored!Vector clamp (A, B, C) (A a, B b, C c) if (isStoredOrLiteral!(Vector, A) && isStoredOrLiteral!(Vector, B) && isStoredOrLiteral!(Vector, C)) { alias T = Vector; auto _a = asKernelStored!Vector(a); auto _b = asKernelStored!Vector(b); auto _c = asKernelStored!Vector(c); KernelStored!Vector ks = new KernelStored!Vector(this); main ~= ext!Vector()~" "~ks.name~"=clamp("~_a.name~","~_b.name~","~_c.name~");"; return ks; }
	public auto mix (A, B, C) (A a, B b, C c) if (isStoredOrLiteral!(ElementTypeFromArg!A, A) && isStoredOrLiteral!(ElementTypeFromArg!B, B) && isStoredOrLiteral!(ElementTypeFromArg!C, C) && is(ElementTypeFromArg!A == ElementTypeFromArg!B) && (is(ElementTypeFromArg!C == ElementTypeFromArg!A) || is(ElementTypeFromArg!C == Vector))) { alias T = ElementTypeFromArg!A; auto _a = asKernelStored!(ElementTypeFromArg!A)(a); auto _b = asKernelStored!(ElementTypeFromArg!B)(b); auto _c = asKernelStored!(ElementTypeFromArg!C)(c); KernelStored!T ks = new KernelStored!T(this); main ~= ext!T()~" "~ks.name~"=mix("~_a.name~","~_b.name~","~_c.name~");"; return ks; }
	public auto pow (A, B) (A a, B b) if (isStoredOrLiteral!(ElementTypeFromArg!A, A) && isStoredOrLiteral!(ElementTypeFromArg!B, B) && (is(ElementTypeFromArg!A == ElementTypeFromArg!B) || is(ElementTypeFromArg!B == Vector))) { alias T = ElementTypeFromArg!A; auto _a = asKernelStored!T(a); auto _b = asKernelStored!T(b); KernelStored!T ks = new KernelStored!T(this); main ~= ext!T()~" "~ks.name~"=pow("~_a.name~","~_b.name~");"; return ks; }
	public auto min (A, B) (A a, B b) if (isStoredOrLiteral!(ElementTypeFromArg!A, A) && isStoredOrLiteral!(ElementTypeFromArg!B, B) && is(ElementTypeFromArg!A == ElementTypeFromArg!B)) { alias T = ElementTypeFromArg!A; auto _a = asKernelStored!T(a); auto _b = asKernelStored!T(b); KernelStored!T ks = new KernelStored!T(this); main ~= ext!T()~" "~ks.name~"=min("~_a.name~","~_b.name~");"; return ks; }
	public auto max (A, B) (A a, B b) if (isStoredOrLiteral!(ElementTypeFromArg!A, A) && isStoredOrLiteral!(ElementTypeFromArg!B, B) && is(ElementTypeFromArg!A == ElementTypeFromArg!B)) { alias T = ElementTypeFromArg!A; auto _a = asKernelStored!T(a); auto _b = asKernelStored!T(b); KernelStored!T ks = new KernelStored!T(this); main ~= ext!T()~" "~ks.name~"=max("~_a.name~","~_b.name~");"; return ks; }
	public auto dot (A, B) (A a, B b) if (isStoredOrLiteral!(ElementTypeFromArg!A, A) && isStoredOrLiteral!(ElementTypeFromArg!B, B) && is(ElementTypeFromArg!A == ElementTypeFromArg!B)) { auto _a = asKernelStored!(ElementTypeFromArg!A)(a); auto _b = asKernelStored!(ElementTypeFromArg!B)(b); KernelStored!Vector ks = new KernelStored!Vector(this); main ~= ext!Vector()~" "~ks.name~"=dot("~_a.name~","~_b.name~");"; return ks; }
	public auto sin (V) (V v) if (isStoredOrLiteral!(ElementTypeFromArg!V, V)) { alias T = ElementTypeFromArg!V; auto _v = asKernelStored!T(v); KernelStored!T ks = new KernelStored!T(this); main ~= ext!T() ~ " " ~ ks.name ~ "=sin(" ~ _v.name ~ ");"; return ks; }
	public auto cos (V) (V v) if (isStoredOrLiteral!(ElementTypeFromArg!V, V)) { alias T = ElementTypeFromArg!V; auto _v = asKernelStored!T(v); KernelStored!T ks = new KernelStored!T(this); main ~= ext!T() ~ " " ~ ks.name ~ "=cos(" ~ _v.name ~ ");"; return ks; }
	public auto tan (V) (V v) if (isStoredOrLiteral!(ElementTypeFromArg!V, V)) { alias T = ElementTypeFromArg!V; auto _v = asKernelStored!T(v); KernelStored!T ks = new KernelStored!T(this); main ~= ext!T() ~ " " ~ ks.name ~ "=tan(" ~ _v.name ~ ");"; return ks; }
	public auto abs (V) (V v) if (isStoredOrLiteral!(ElementTypeFromArg!V, V)) { alias T = ElementTypeFromArg!V; auto _v = asKernelStored!T(v); KernelStored!T ks = new KernelStored!T(this); main ~= ext!T() ~ " " ~ ks.name ~ "=abs(" ~ _v.name ~ ");"; return ks; }
	public auto atan (V) (V v) if (isStoredOrLiteral!(ElementTypeFromArg!V, V)) { alias T = ElementTypeFromArg!V; auto _v = asKernelStored!T(v); KernelStored!T ks = new KernelStored!T(this); main ~= ext!T() ~ " " ~ ks.name ~ "=atan(" ~ _v.name ~ ");"; return ks; }
	public auto normalize (V) (V v) if (isStoredOrLiteral!(ElementTypeFromArg!V, V)) { alias T = ElementTypeFromArg!V; auto _v = asKernelStored!T(v); KernelStored!T ks = new KernelStored!T(this); main ~= ext!T() ~ " " ~ ks.name ~ "=normalize(" ~ _v.name ~ ");"; return ks; }
	public KernelStored!T op (T, A, B) (A a, string op, B b) if (isStoredOrLiteral!(ElementTypeFromArg!A, A) && isStoredOrLiteral!(ElementTypeFromArg!B, B)) { auto _a = asKernelStored!(ElementTypeFromArg!A)(a); auto _b = asKernelStored!(ElementTypeFromArg!B)(b); KernelStored!T ks = new KernelStored!T(this); main ~= ext!T()~" "~ks.name~"="~_a.name~op~_b.name~";"; return ks; }
	public KernelStored!Vector4 sample (A) (KernelParameter!Texture tex, A a) if (isStoredOrLiteral!(Vector2, A)) { auto _a = asKernelStored!(ElementTypeFromArg!A)(a); KernelStored!Vector4 ks = new KernelStored!Vector4(this); main ~= ext!Vector4()~" "~ks.name~"=texture("~tex.name~","~_a.name~");"; return ks; }
	public void output (A) (A a) if (isStoredOrLiteral!(Vector4, A)) { auto _a = asKernelStored!(ElementTypeFromArg!A)(a); main ~= "finalColor="~_a.name~";"; }
	public void earlyOutput (A, B) (A a, B b) if (isStoredOrLiteral!(ElementTypeFromArg!bool, A) && isStoredOrLiteral!(ElementTypeFromArg!Vector4, B)) { auto _a = asKernelStored!(ElementTypeFromArg!A)(a); auto _b = asKernelStored!(ElementTypeFromArg!B)(b); main ~= "if("~_a.name~"){finalColor="~_b.name~";return;}"; }
	public void branch (A) (A a, void delegate (Kernel) positive, void delegate (Kernel) negative) if (isStoredOrLiteral!(ElementTypeFromArg!bool, A)) { auto _a = asKernelStored!(ElementTypeFromArg!A)(a); main~="if("~_a.name~"){";positive(this);main~="}else{";negative(this);main~="}";}
	public void loop (A, B) (A begin, string checkOp = "<", B until, string updateOp = "++", void delegate (Kernel, KernelStored!(ElementTypeFromArg!A)) eval) if (isStoredOrLiteral!(ElementTypeFromArg!(ElementTypeFromArg!A, A)) &&  isStoredOrLiteral!(ElementTypeFromArg!(ElementTypeFromArg!B, B)) && is(ElementTypeFromArg!A == ElementTypeFromArg!B)) { auto _a = asKernelStored!(ElementTypeFromArg!A)(begin); auto _b = asKernelStored!(ElementTypeFromArg!A)(until); auto i = new KernelStored!(ElementTypeFromArg!A)(this); main~="for("~i.name~"="~_a.name~";"~i.name~checkOp~_b.name~";"~i.name~updateOp~"){"; eval(this, i); main~="}"; }

	public KernelStored!(ElementTypeFromArg!B) step (A, B) (A a, B b) if (isStoredOrLiteral!(ElementTypeFromArg!A, A) && isStoredOrLiteral!(ElementTypeFromArg!B, B)) { auto _a = asKernelStored!(ElementTypeFromArg!A)(a); auto _b = asKernelStored!(ElementTypeFromArg!B)(b); alias T = ElementTypeFromArg!B; KernelStored!T ks = new KernelStored!T(this); main ~= ext!T()~" "~ks.name~"=step("~_a.name~","~_b.name~");"; return ks; }
	public KernelStored!(ElementTypeFromArg!C) smoothstep (A, B, C) (A a, B b, C c) if (isStoredOrLiteral!(ElementTypeFromArg!A, A) && isStoredOrLiteral!(ElementTypeFromArg!B, B) && isStoredOrLiteral!(ElementTypeFromArg!C, C) && is(ElementTypeFromArg!A == ElementTypeFromArg!B) && (is(ElementTypeFromArg!C == ElementTypeFromArg!A) || is(ElementTypeFromArg!C == Vector))) { auto _a = asKernelStored!(ElementTypeFromArg!A)(a); auto _b = asKernelStored!(ElementTypeFromArg!B)(b); auto _c = asKernelStored!(ElementTypeFromArg!C)(c); alias T = ElementTypeFromArg!C; KernelStored!T ks = new KernelStored!T(this); main ~= ext!T()~" "~ks.name~"=smoothstep("~_a.name~","~_b.name~","~_c.name~");"; return ks; }
	public KernelStored!Vector3 cross (A, B) (A a, B b) if (isStoredOrLiteral!(Vector3, A) && isStoredOrLiteral!(Vector3, B)) { auto _a = asKernelStored!(ElementTypeFromArg!A)(a); auto _b = asKernelStored!(ElementTypeFromArg!B)(b); alias T = Vector3; KernelStored!T ks = new KernelStored!T(this); main ~= ext!T()~" "~ks.name~"=cross("~_a.name~","~_b.name~");"; return ks; }
	public auto reflect (A, B) (A a, B b) if (isStoredOrLiteral!(ElementTypeFromArg!A, A) && isStoredOrLiteral!(ElementTypeFromArg!B, B) && (is(ElementTypeFromArg!A == ElementTypeFromArg!B))) { auto _a = asKernelStored!(ElementTypeFromArg!A)(a); auto _b = asKernelStored!(ElementTypeFromArg!B)(b); alias T = ElementTypeFromArg!A; KernelStored!T ks = new KernelStored!T(this); main ~= ext!T()~" "~ks.name~"=reflect("~_a.name~","~_b.name~");"; return ks; }
	public auto refract (A, B, C) (A a, B b, C c) if (isStoredOrLiteral!(ElementTypeFromArg!A, A) && isStoredOrLiteral!(ElementTypeFromArg!B, B) && (is(ElementTypeFromArg!A == ElementTypeFromArg!B)) && isStoredOrLiteral!(Vector, C)) { auto _a = asKernelStored!(ElementTypeFromArg!A)(a); auto _b = asKernelStored!(ElementTypeFromArg!B)(b); auto _c = asKernelStored!(ElementTypeFromArg!C)(c); alias T = ElementTypeFromArg!A; KernelStored!T ks = new KernelStored!T(this); main ~= ext!T()~" "~ks.name~"=refract("~_a.name~","~_b.name~","~_c.name~");"; return ks; }
	public KernelStored!Vector length (V) (V v) if (isStoredOrLiteral!(ElementTypeFromArg!V, V) && KernelComponentBased!(ElementTypeFromArg!V)) { alias T = Vector; auto _v = asKernelStored!T(v); KernelStored!T ks = new KernelStored!T(this); main ~= ext!T() ~ " " ~ ks.name ~ "=length(" ~ _v.name ~ ");"; return ks; }
	public auto distance (A, B) (A a, B b) if (isStoredOrLiteral!(ElementTypeFromArg!A, A) && isStoredOrLiteral!(ElementTypeFromArg!B, B) && (is(ElementTypeFromArg!A == ElementTypeFromArg!B))) { auto _a = asKernelStored!(ElementTypeFromArg!A)(a); auto _b = asKernelStored!(ElementTypeFromArg!B)(b); alias T = KernelStoredLength!(ElementTypeFromArg!A); KernelStored!T ks = new KernelStored!T(this); main ~= ext!T()~" "~ks.name~"=distance("~_a.name~","~_b.name~");"; return ks; }
	public auto faceforward (A, B, C) (A a, B b, C c) if (isStoredOrLiteral!(ElementTypeFromArg!A, A) && isStoredOrLiteral!(ElementTypeFromArg!B, B) && isStoredOrLiteral!(ElementTypeFromArg!C, C) && (is(ElementTypeFromArg!A == ElementTypeFromArg!B)) && (is(ElementTypeFromArg!A == ElementTypeFromArg!C))) { auto _a = asKernelStored!(ElementTypeFromArg!A)(a); auto _b = asKernelStored!(ElementTypeFromArg!B)(b); auto _c = asKernelStored!(ElementTypeFromArg!C)(c); alias T = ElementTypeFromArg!A; KernelStored!T ks = new KernelStored!T(this); main ~= ext!T()~" "~ks.name~"=faceforward("~_a.name~","~_b.name~","~_c.name~");"; return ks; }
	public void break_ () { main ~= "break;"; }
	public void discard () { main ~= "discard;"; }
	public void exit () { main ~= "return;"; }
	
	private KernelStored!T asKernelStored(T, A)(A a) if (is(A : KernelStored!T) || (KernelLiteral!T && is(A : T))) {
		static if (is(A : KernelStored!T)) {
			return a;
		} else {
			return this.literal!T(a);
		}
	}
	
	public string exportCode () {
		return "#version 330 core\nin vec2 uv;out vec4 finalColor;"
		~ setupCompose
		~ "void main () {"
		~ main
		~ "}";
	}

	public Shader build () {
		debug { import std.stdio : writeln; try { writeln("rebuilt shader", &(this.shader)); } catch (Exception) {} }
		shader = new Shader(exportCode());
		foreach (string name, void delegate(GLint) hook; lateUniformUpdate) {
			import std.string;
			GLint location = shader.address(name);
			lateUniformUpdate[name](location);
			shader.hook(upload[name]);
		}
		return shader;
	}
}

template StoredOrLiteral (A) {
	enum StoredOrLiteral = (is(A : KernelStored!T) || (KernelLiteral!T && is(A : T)));
}

template KernelLiteral (T) {
	enum KernelLiteral = is(T == bool) ||is(T == int) || is(T == Vector) || is(T == Vector2) || is(T == Vector3) || is(T == Vector4);
}

template KernelStoredLength (T) {
	static if (is(T == int)) alias KernelStoredLength = int;
	static if (is(T == Vector) || KernelComponentBased!T) alias KernelStoredLength = Vector;
}

template KernelComponentBased (T) {
	enum KernelComponentBased = is(T == Vector2) || is(T == Vector3) || is(T == Vector4);
}

string serialize (T) (T literal) {
	import std.conv;
	static if (is(T == bool)) return to!string(literal);
	static if (is(T == int)) return to!string(literal);
	else static if (is(T == Vector)) return to!string(literal);
	else static if (is(T == Vector2)) return "vec2("~to!string(literal.x)~","~to!string(literal.y)~")";
	else static if (is(T == Vector3)) return "vec3("~to!string(literal.x)~","~to!string(literal.y)~","~to!string(literal.z)~")";
	else static if (is(T == Vector4)) return "vec4("~to!string(literal.x)~","~to!string(literal.y)~","~to!string(literal.z)~","~to!string(literal.w)~")";
	else static assert (false);
}
