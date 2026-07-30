module bismuth.effect.gradient;

import bismuth;

private Kernel kernel;
private KernelParameter!Texture back;
private KernelParameter!Vector4 krect;
private KernelParameter!Vector2 kdir;
private KernelParameter!Vector4 ka;
private KernelParameter!Vector4 kb;
private KernelParameter!Vector2 position;
private KernelParameter!Vector2 invSize;
private KernelParameter!Vector2 power;
private KernelParameter!Vector corner;
private KernelParameter!bool shaped;

public void drawGradient (Texture target = Texture.screen, Texture source = Texture.screen, Shape shape, Vector angle, Color a, Color b) {
	if (Texture.temp is null) Texture.temp = new Texture(screenSize);
	if (Texture.temp.size != screenSize) Texture.temp = new Texture(screenSize);
	
	Vector4 rect = Vector4(
		shape.position.x - shape.size.x,
		shape.position.y - shape.size.y,
		shape.size.x * 2,
		shape.size.y * 2,
	);
	Copy.draw(rect, source, rect, Texture.temp);
	back.set(Texture.temp);
	position.set(shape.position);
	power.set((shape.size * 2) / shape.radius);
	invSize.set(Vector2.one / shape.size);
	corner.set(min(shape.radius.x, shape.radius.y));
	krect.set(rect / Vector4(target.size.x, target.size.y, target.size.x, target.size.y));
	kdir.set(Vector2(cos(angle), sin(angle)));
	ka.set(a);
	kb.set(b);
	shaped.set(true);
	kernel.draw(target, rect);
}

public void drawGradient (Texture target = Texture.screen, Texture source = Texture.screen, Vector4 rect, Vector angle, Color a, Color b) {
	if (Texture.temp is null) Texture.temp = new Texture(screenSize);
	if (Texture.temp.size != screenSize) Texture.temp = new Texture(screenSize);
	Copy.draw(rect, source, rect, Texture.temp);
	back.set(Texture.temp);
	//position.set(shape.position);
	//power.set((shape.size * 2) / shape.radius);
	//invSize.set(Vector2.one / shape.size);
	//corner.set(min(shape.radius.x, shape.radius.y));
	krect.set(rect / Vector4(target.size.x, target.size.y, target.size.x, target.size.y));
	kdir.set(Vector2(cos(angle), sin(angle)));
	ka.set(a);
	kb.set(b);
	shaped.set(false);
	kernel.draw(target, rect);
}

public void initGradient () {
	kernel = new Kernel((Kernel k) { with (k) {
		back = uniform!Texture();
		krect = uniform!Vector4();
		kdir = uniform!Vector2();
		ka = uniform!Vector4();
		kb = uniform!Vector4();
		position = uniform!Vector2();
		invSize = uniform!Vector2();
		power = uniform!Vector2();
		corner = uniform!Vector();
		shaped = uniform!bool();

		branch(shaped, (Kernel k) {
			auto inside = calculateShape(
				k, coord.component!"xy", position, invSize, power, literal(Vector2(1, 0))
			);

			auto wp = sample(back, uv);
			earlyOutput(op!bool(inside, ">=", Vector(1)), wp);
			KernelStored!Vector mask = max(literal(Vector(0)), Vector(1) - shapeMask(k, inside, corner * Vector(0.5)));

			auto corner0 = krect.component!"xy";
			auto corner1 = krect.component!"xy" + compose(krect.component!"z", 0.0f);
			auto corner2 = krect.component!"xy" + compose(0.0f, krect.component!"w");
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
			auto t = clamp((proj - minProj) / (maxProj - minProj), 0.0f, 1.0f);

			auto color = mix(
				wp,
				mix(ka, kb, t),
				mask,
			);

			output(color);
		}, (Kernel k) {
			auto corner0 = krect.component!"xy";
			auto corner1 = krect.component!"xy" + compose(krect.component!"z", 0.0f);
			auto corner2 = krect.component!"xy" + compose(0.0f, krect.component!"w");
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
			auto t = clamp((proj - minProj) / (maxProj - minProj), 0.0f, 1.0f);

			auto color = mix(ka, kb, t);

			output(color);
		});
	}});
}
