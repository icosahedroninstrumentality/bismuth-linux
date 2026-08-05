module bismuth.effect.gradient;

import bismuth.framework;

public class Gradient {
	private __gshared Kernel kernel;
	private __gshared KernelParameter!Texture back;
	private __gshared KernelParameter!Vector4 krect;
	private __gshared KernelParameter!Vector2 kdir;
	private __gshared KernelParameter!Vector4 ka;
	private __gshared KernelParameter!Vector4 kb;
	private __gshared KernelParameter!Vector2 position;
	private __gshared KernelParameter!Vector2 invSize;
	private __gshared KernelParameter!Vector2 power;
	private __gshared KernelParameter!Radian corner;
	private __gshared KernelParameter!bool shaped;

	private shared static this () {
		kernel = new Kernel((Kernel k) { with (k) {
			back = uniform!Texture();
			krect = uniform!Vector4();
			kdir = uniform!Vector2();
			ka = uniform!Vector4();
			kb = uniform!Vector4();
			position = uniform!Vector2();
			invSize = uniform!Vector2();
			power = uniform!Vector2();
			corner = uniform!Radian();
			shaped = uniform!bool();

			branch(shaped, (Kernel k) {
				auto inside = calculateShape(
					k, coord.component!"xy", position, invSize, power, literal(Degree.zero.direction)
				);

				auto wp = sample(back, uv);
				earlyOutput(op!bool(inside, ">=", Radian.one), wp);
				KernelStored!Radian mask = max(literal(Radian.zero), Radian.one - shapeMask(k, inside, corner * Radian(0.5)));

				auto corner0 = krect.component!"xy";
				auto corner1 = krect.component!"xy" + compose(krect.component!"z", Radian.zero);
				auto corner2 = krect.component!"xy" + compose(Radian.zero, krect.component!"w");
				auto corner3 = krect.component!"xy" + krect.component!"zw";

				// Project corners onto the gradient direction
				auto d0 = dot(corner0, kdir);
				auto d1 = dot(corner1, kdir);
				auto d2 = dot(corner2, kdir);
				auto d3 = dot(corner3, kdir);

				auto minProj = min(min(d0, d1), min(d2, d3));
				auto maxProj = max(max(d0, d1), max(d2, d3));

				// Project current UV
				auto proj = dot(uv, kdir);

				// Interpolation factor (handle degenerate case where maxProj == minProj)
				auto t = clamp((proj - minProj) / (maxProj - minProj), Radian.zero, Radian.one);

				auto color = mix(
					wp,
					mix(ka, kb, t),
					mask,
				);

				output(color);
			}, (Kernel k) {
				auto corner0 = krect.component!"xy";
				auto corner1 = krect.component!"xy" + compose(krect.component!"z", Radian.zero);
				auto corner2 = krect.component!"xy" + compose(Radian.zero, krect.component!"w");
				auto corner3 = krect.component!"xy" + krect.component!"zw";

				// Project corners onto the gradient direction
				auto d0 = dot(corner0, kdir);
				auto d1 = dot(corner1, kdir);
				auto d2 = dot(corner2, kdir);
				auto d3 = dot(corner3, kdir);

				auto minProj = min(min(d0, d1), min(d2, d3));
				auto maxProj = max(max(d0, d1), max(d2, d3));

				// Project current UV
				auto proj = dot(uv, kdir);

				// Interpolation factor (handle degenerate case where maxProj == minProj)
				auto t = clamp((proj - minProj) / (maxProj - minProj), Radian.zero, Radian.one);

				auto color = mix(ka, kb, t);

				output(color);
			});
		}});
	}

	public static void draw (Texture target = Texture.screen, Texture source = Texture.screen, Shape shape, Degree angle, Vector4 a, Vector4 b) {
		Vector4 rect = Vector4(
			shape.position.x - shape.size.x,
			shape.position.y - shape.size.y,
			shape.size.x * Radian.two,
			shape.size.y * Radian.two,
		);
		back.set(source);
		position.set(shape.position);
		power.set((shape.size * Radian.two) / shape.radius);
		invSize.set(Vector2.one / shape.size);
		corner.set(min(shape.radius.x, shape.radius.y));
		krect.set(rect / Vector4(target.size.x, target.size.y, target.size.x, target.size.y));
		kdir.set(angle.direction);
		ka.set(a);
		kb.set(b);
		shaped.set(true);
		kernel.draw(target, rect);
	}

	public static void draw (Texture target = Texture.screen, Texture source = Texture.screen, Vector4 rect, Degree angle, Vector4 a, Vector4 b) {
		back.set(source);
		//position.set(shape.position);
		//power.set((shape.size * 2) / shape.radius);
		//invSize.set(Vector2.one / shape.size);
		//corner.set(min(shape.radius.x, shape.radius.y));
		krect.set(rect / Vector4(target.size.x, target.size.y, target.size.x, target.size.y));
		kdir.set(angle.direction);
		ka.set(a);
		kb.set(b);
		shaped.set(false);
		kernel.draw(target, rect);
	}
}
