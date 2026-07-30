module bismuth.effect.copy;

import bismuth;

class Copy {
	__gshared Kernel kernel = Kernel.create();
	__gshared KernelParameter!Texture texture;
	__gshared KernelParameter!Vector4 ksourceRect;
	__gshared KernelParameter!Vector4 ktargetRect;

	shared static this () {kernel.compute((Kernel k) { with (k) {
		texture = uniform!Texture();
		ksourceRect = uniform!Vector4();
		ktargetRect = uniform!Vector4();
		output(sample(texture, mix(
			ksourceRect.component!"xy",
			ksourceRect.component!"zw",
			(coord.component!"xy" - ktargetRect.component!"xy") / ktargetRect.component!"zw"
		)));
	}});}

	public static void draw (
		Vector4 sourceRect,
		Texture source,
		Vector4 targetRect,
		Texture target,
	) {
		if (targetRect.z <= 0 || targetRect.w <= 0) return;
		if (sourceRect.z <= 0 || sourceRect.w <= 0) return;
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
