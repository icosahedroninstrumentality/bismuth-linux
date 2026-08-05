module bismuth.framework;

public import bismuth.framework.jitkernel;
public import bismuth.framework.opengl;
public import bismuth.framework.texture;
public import bismuth.framework.text;
public import vector;
public import prototypes;

public void setup () {}

public alias RGBA = Vector4;
public alias Color = Vector4;

public @property RGBA opaque (RGBA c) {
	return RGBA(c.x, c.y, c.z, Radian.one);
}

/// Oklab 
public struct OKLCHA {
	public static enum OKLCHA one =   OKLCHA(Radian.one, Radian.zero, Degree(0), Radian.one);
	public static enum OKLCHA zero =  OKLCHA(Radian.zero, Radian.zero, Degree(0), Radian.zero);
	
	public static enum OKLCHA white = OKLCHA(Radian.one, Radian.zero, Degree(0), Radian.one);
	public static enum OKLCHA black = OKLCHA(Radian.zero, Radian.zero, Degree(0), Radian.one);

	Radian l = Radian.zero;
	Radian c = Radian.zero;
	Degree h = Degree(0);
	Radian a = Radian.one;

	this () (
		Radian l_ = Radian.zero,
		Radian c_ = Radian.zero,
		Degree h_ = Degree(0),
		Radian a_ = Radian.one,
	) {
		this.l = l_;
		this.c = c_;
		this.h = h_;
		this.a = a_;
	}

	OKLCHA opBinary (string op) (OKLCHA rhs) {
		return OKLCHA(
			mixin("l " ~ op ~ " rhs.l"),
			mixin("c " ~ op ~ " rhs.c"),
			mixin("h " ~ op ~ " rhs.h"),
			mixin("a " ~ op ~ " rhs.a"),
		);
	}

	void opOpAssign (string op) (OKLCHA rhs) {
		mixin("l " ~ op ~ "= rhs.l;");
		mixin("c " ~ op ~ "= rhs.c;");
		mixin("h " ~ op ~ "= rhs.h;");
		mixin("a " ~ op ~ "= rhs.a;");
	}

	string toString () const @safe pure {
		import std.format;
		return format("OKLCHA(%s, %s, %s, %s)", l, c, h, a);
	}

	public RGBA extractRGBA () const {
		// OKLCH → OKLab
		Vector2 V = h.direction * c;

		// OKLAB → LMS linear
		Vector3 LMS = Vector3(
			(Radian.one * l + Radian(0.3963377774) * V.x + Radian(0.2158037573) * V.y).pow(Radian(3)),
			(Radian.one * l - Radian(0.1055613458) * V.x - Radian(0.0638541728) * V.y).pow(Radian(3)),
			(Radian.one * l - Radian(0.0894841775) * V.x - Radian(1.2914855480) * V.y).pow(Radian(3)),
		);

		/// LMS linear → RGB linear
		Vector3 linear = Vector3(
			Radian( 4.0767416621) * LMS.x - Radian(3.3077115913) * LMS.y + Radian(0.2309699292) * LMS.z,
			Radian(-1.2684380046) * LMS.x + Radian(2.6097574011) * LMS.y - Radian(0.3413193965) * LMS.z,
			Radian(-0.0041960863) * LMS.x - Radian(0.7034186147) * LMS.y + Radian(1.7076147010) * LMS.z,
		);

		// gamma correct
		Radian gamma(Radian v) {
			if (v > Radian(0.0031308))
				return Radian(1.055) * v.pow(Radian(1.0 / 2.4)) - Radian(0.055);
			else
				return Radian(12.92) * v;
		}

		return RGBA(
			gamma(linear.x).clamp(Radian.zero, Radian.one),
			gamma(linear.y).clamp(Radian.zero, Radian.one),
			gamma(linear.z).clamp(Radian.zero, Radian.one),
			a.clamp(Radian.zero, Radian.one),
		);
	}

	alias extractRGBA this;

	public @property OKLCHA opaque () {
		return OKLCHA(l, c, h, Radian.one);
	}

	/// Perceptual color mixig
	public OKLCHA mix (OKLCHA other, Radian v) {
		Vector2 cv = (h.direction * c).mix(other.h.direction * other.c, v);
		return OKLCHA(
			l.mix(other.l, v),
			cv.length,
			cv.angle,
			a.mix(other.a, v),
		);
	}

	public @property OKLCHA invertLuma (Radian v = Radian(1)) {
		return OKLCHA(l.mix(Radian(1)-l, v), c, h, a);
	}

	public @property OKLCHA invertChroma (Radian v = Radian(1)) {
		return OKLCHA(l, c.mix(Radian(1)-c, v), h, a);
	}

	public @property OKLCHA invertHue (Radian v = Radian(1)) {
		return OKLCHA(l, c, h.mix(h.invert, v), a);
	}
}
