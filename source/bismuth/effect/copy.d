module bismuth.effect.copy;

import bismuth.framework;

class Copy {
	private __gshared Kernel kernel;
	private __gshared KernelParameter!Texture texture;
	private __gshared KernelParameter!Vector4 ksourceRect;
	private __gshared KernelParameter!Vector4 ktargetRect;

	private shared static this () {
		kernel = new Kernel((Kernel k) { with (k) {
			texture = uniform!Texture();
			ksourceRect = uniform!Vector4();
			ktargetRect = uniform!Vector4();
			output(sample(texture, translateUV(k, ksourceRect, ktargetRect)));
		}});
	}

	public static void draw (
		Vector4 sourceRect,
		Texture source,
		Vector4 targetRect,
		Texture target,
	) {
		texture.set(source);

		// Convert sourceRect from pixel coordinates to normalized texture coordinates
		Vector2 sourceSize = source.size;
		Vector4 normalizedSourceRect = Vector4(
			sourceRect.x / sourceSize.x,
			sourceRect.y / sourceSize.y,
			(sourceRect.x + sourceRect.z) / sourceSize.x,
			(sourceRect.y + sourceRect.w) / sourceSize.y
		);
		ksourceRect.set(normalizedSourceRect);
		ktargetRect.set(targetRect);

		kernel.draw(target, targetRect);
	}
}
