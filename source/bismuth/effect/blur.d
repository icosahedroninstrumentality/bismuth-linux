module bismuth.effect.blur;

import bismuth.framework;

class Blur {
	private __gshared Kernel kernel;
	private __gshared KernelParameter!Texture ktexture;
	private __gshared KernelParameter!Vector4 ksourceRect;
	private __gshared KernelParameter!Vector4 ktargetRect;
	private __gshared KernelParameter!Radian  kradius;
	private __gshared KernelParameter!Vector2 kdir;
	private __gshared KernelParameter!Radian  ksamples;
	private __gshared KernelParameter!Vector2 kpx;
	private __gshared Texture a;
	private __gshared Texture b;

	private shared static this () {
		kernel = new Kernel((Kernel k) { with (k) {
			ktexture = uniform!Texture();
			ksourceRect = uniform!Vector4();
			ktargetRect = uniform!Vector4();
			kradius = uniform!Radian();
			kdir = uniform!Vector2();
			ksamples = uniform!Radian();
			kpx = uniform!Vector2();

			auto maxSamples = define(maxBlurSamples);

			auto texCoord = translateUV(k, ksourceRect, ktargetRect);

			auto blurred = ksourceRect * Radian.zero;

			auto s = kradius * Radian.zero;
			loop!(int, KernelStored!int)(0, "<", maxSamples, "++", (Kernel k, KernelStored!int i) {
				branch(op!bool(s, ">=", ksamples), (Kernel k) {break_();}, (Kernel k){});

				auto t = (s + Radian(0.5)) / ksamples;
				auto currentRadius = kradius * (Radian.one - t);
				auto offset = kdir * kpx * currentRadius;

				blurred += sample(ktexture, texCoord + offset);
				blurred += sample(ktexture, texCoord - offset);
				s += 1;
			});

			output(blurred / (ksamples * Radian.two));
		}});
	}

	public static void draw (Texture source, Vector4 sourceRect, Texture target, Vector4 targetRect, Radian radius) {
		if (a is null || a.size != Texture.screen.size) a = new Texture(Texture.screen.size);
		if (b is null || b.size != Texture.screen.size) b = new Texture(Texture.screen.size);
		Vector4 spad = sourceRect + Vector4(-radius, -radius, radius * Radian.two, radius * Radian.two);
		Vector4 tpad = targetRect + Vector4(-radius, -radius, radius * Radian.two, radius * Radian.two);
		draw_(source, spad, a,      tpad,       radius, Degree(0));
		draw_(a,      spad, b,      tpad,       radius, Degree(120));
		draw_(b,      spad, target, targetRect, radius, Degree(240));
	}

	public __gshared int maxBlurSamples = 64;
	private static void draw_ (Texture source, Vector4 sourceRect, Texture target, Vector4 targetRect, Radian radius, Degree angle) {
		ktexture.set(source);
		// Convert sourceRect from pixel coordinates to normalized texture coordinates
		Vector2 sourceSize = source.size;
		ksourceRect.set(Vector4(
			sourceRect.x / sourceSize.x,
			sourceRect.y / sourceSize.y,
			(sourceRect.x + sourceRect.z) / sourceSize.x,
			(sourceRect.y + sourceRect.w) / sourceSize.y
		));
		ktargetRect.set(targetRect);
		kradius.set(radius);
		kdir.set(angle.direction);
		ksamples.set(min(Radian(maxBlurSamples), (radius * Radian(0.25)).ceil.max(Radian.one) * Radian.two));
		kpx.set(source.size.invert);

		kernel.draw(target, targetRect);
	}
}
