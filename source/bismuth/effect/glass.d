module bismuth.effect.glass;

import bismuth;
import std.math;

public struct Glass {
	Shape shape;
	Vector angle = 0.0;
	Vector shineAngle = 0;
	Vector blur = 0.0;
	Color transmission = Color(0.75, 0.76, 0.77, 1.0);
	Color reflection = Color(0.75, 0.76, 0.77, 1.0);
	Color emission = Color(0.01, 0.02, 0.03, 1.0);
	Color shine = Vector4.one;//Color(0.51, 0.52, 0.53, 1.0);
	Color border = Vector4.zero;//Color(0.51, 0.52, 0.53, 1.0);
}

public void drawGlass (
	Glass glass,
	Texture _back = Texture.screen,
	Texture _trr = Texture.screen,
	Texture _trl = Texture.screen,
	Texture target = Texture.screen
) {
	import std.algorithm;
	Vector2 minRadiusSize = Vector2(
		min(glass.shape.radius.x, glass.shape.size.x),
		min(glass.shape.radius.y, glass.shape.size.y),
	);
	Vector minRad = min(minRadiusSize.x, minRadiusSize.y);
	Vector maxSize = max(glass.shape.size.x, glass.shape.size.y);
	Vector4 region = (glass.angle == Vector(0)) ? Vector4(
		glass.shape.position.x - glass.shape.size.x,
		glass.shape.position.y - glass.shape.size.y,
		glass.shape.size.x * 2,
		glass.shape.size.y * 2,
	) : Vector4(
		glass.shape.position.x - glass.shape.size.x,
		glass.shape.position.y - glass.shape.size.y,
		glass.shape.size.x * 2,
		glass.shape.size.y * 2,
	);

	Vector4 regionR = region + Vector4(
		-glass.shape.radius.x, -glass.shape.radius.y,
		 glass.shape.radius.x * 2, glass.shape.radius.y * 2,
	);
	Vector4 regionL = region + Vector4(
		-glass.shape.radius.x * 4, -glass.shape.radius.y * 4,
		 glass.shape.radius.x * 8,  glass.shape.radius.y * 8,
	);

	// Ensure temporary textures match current screen size (lazy init / resize)
	if (back is null || back.size != screenSize) back = new Texture(screenSize);
	if (trr is null || trr.size != screenSize) trr = new Texture(screenSize);
	if (trl is null || trl.size != screenSize) trl = new Texture(screenSize);
	
	Copy.draw(region, _back, region, back);
	
	if (glass.blur == 0) Copy.draw(regionR, _trr, regionR, trr);
	else drawBlur(BlurInstruction( regionR, _trr, regionR, trr, glass.blur));
	
	if (glass.blur == 0) Copy.draw(regionL, _trl, regionL, trl);
	else drawBlur(BlurInstruction( regionL, _trl, regionL, trl, glass.blur));
	
	kback.set(back);
	ktrr.set(trr);
	ktrl.set(trl);

	position.set(glass.shape.position);
	size.set(glass.shape.size);
	invSize.set(Vector2.one / glass.shape.size);
	corner.set(glass.shape.radius);
	power.set((glass.shape.size * 2.0) / glass.shape.radius);

	minRadius.set(minRad);
	
	reflection.set(glass.reflection);
	emission.set(glass.emission);
	transmission.set(glass.transmission);
	shine.set(glass.shine);
	rotate.set(Vector2(cos(glass.angle), sin(glass.angle)));
	kborder.set(glass.border);

	shineDir.set(Vector2(cos(glass.shineAngle), sin(glass.shineAngle)).normalize());
	px.set(Vector2.one / screenSize);
	
	kernel.draw( // exit -11 here
		target,
		region,
	);
}

private Kernel kernel;

private KernelParameter!Vector2 position;
private KernelParameter!Vector2 invSize;
private KernelParameter!Vector2 power;
private KernelParameter!Vector2 size;
private KernelParameter!Vector2 corner;
private KernelParameter!Vector  minRadius;
private KernelParameter!Vector4 reflection;
private KernelParameter!Vector4 emission;
private KernelParameter!Vector4 transmission;
private KernelParameter!Vector4 shine;
private KernelParameter!Vector2 rotate;
private KernelParameter!Vector2 shineDir;
private KernelParameter!Vector2 px;
private KernelParameter!Texture kback;
private KernelParameter!Texture ktrr;
private KernelParameter!Texture ktrl;
private KernelParameter!Vector4 kborder;

private Texture back;
private Texture trr;
private Texture trl;

public void initGlass () {
	kernel = new Kernel((Kernel k) { with (k) {
		position = uniform!Vector2();
		size = uniform!Vector2();
		invSize = uniform!Vector2();
		corner = uniform!Vector2();
		power = uniform!Vector2();
		minRadius = uniform!Vector();
		reflection = uniform!Vector4();
		emission = uniform!Vector4();
		transmission = uniform!Vector4();
		shine = uniform!Vector4();
		rotate = uniform!Vector2();
		shineDir = uniform!Vector2();
		px = uniform!Vector2();
		kback = uniform!Texture();
		ktrr = uniform!Texture();
		ktrl = uniform!Texture();
		kborder = uniform!Vector4();
		
		KernelStored!Vector calculateMaskB() {
			KernelStored!Vector2 newPower = ((size - Vector(1)) * Vector(2)) / (corner - Vector(1));
			KernelStored!Vector2 offset = coord.component!"xy" - position;
			KernelStored!Vector2 rotated = compose(
				offset.component!"x" * rotate.component!"x" - offset.component!"y" * rotate.component!"y",
				offset.component!"x" * rotate.component!"y" + offset.component!"y" * rotate.component!"x"
			);
			KernelStored!Vector2 d = pow(
				abs(rotated / (size - Vector(1))),
				newPower
			);
			KernelStored!Vector sum = d.component!"x" + d.component!"y";
			return Vector(1) - min(
				literal(Vector(1)),
				pow(sum, minRadius - Vector(1))
			);
		}

		KernelStored!Vector calculateInsideS () {
			KernelStored!Vector2 newPower = ((size - Vector(2)) * Vector(2)) / (corner - Vector(2));
			KernelStored!Vector2 offset = coord.component!"xy" - position;
			KernelStored!Vector2 rotated = compose(
				offset.component!"x" * rotate.component!"x" - offset.component!"y" * rotate.component!"y",
				offset.component!"x" * rotate.component!"y" + offset.component!"y" * rotate.component!"x",
			);
			KernelStored!Vector2 d = pow(abs(rotated / (size - Vector(2))), newPower);
			return min(literal(Vector(1)), d.component!"x" + d.component!"y");
		}

		KernelStored!Vector i = calculateShape(k,
			coord.component!"xy", position, invSize, power, rotate
		);
		earlyOutput(op!bool(i, ">", Vector(1)), sample(kback, uv));
		KernelStored!Vector3 inside = compose(
			calculateShape(k, coord.component!"xy" + Vector2(1, 0), position, invSize, power, rotate),
			calculateShape(k, coord.component!"xy" + Vector2(0, 1), position, invSize, power, rotate),
			i,
		);
		KernelStored!Vector mask = max(literal(Vector(0)), Vector(1) - shapeMask(k, inside.component!"z", minRadius));

		KernelStored!Vector2 grad = compose(inside.component!"x" - inside.component!"z", inside.component!"y" - inside.component!"z");
		KernelStored!Vector2 dir_ = normalize(grad + EPS);
		KernelStored!Vector2 offsetR = dir_ * pow(inside.component!"z", literal(Vector(2))) * px * corner * Vector(2);
		KernelStored!Vector2 offsetL = dir_ * (Vector(1) - pow(inside.component!"z", literal(Vector(2)))) * px * corner * Vector(4);

		KernelStored!Vector2 abberation = max(literal(Vector2(0.5)), literal(Vector(1.0)) - literal(Vector(6.0)) / corner);

		KernelStored!Vector4 refracted = compose(
			sample(ktrr, uv - offsetR).component!"r",
			sample(ktrr, uv - offsetR * abberation).component!"g",
			sample(ktrr, uv - offsetR * abberation * abberation).component!"b",
			literal(Vector(1)),
		);

		KernelStored!Vector4 reflected = compose(
			sample(ktrl, uv + offsetL).component!"r",
			sample(ktrl, uv + offsetL * abberation).component!"g",
			sample(ktrl, uv + offsetL * abberation * abberation).component!"b",
			literal(Vector(1)),
		);

		KernelStored!Vector streak = pow(abs(dot(dir_, shineDir)), PI);
		KernelStored!Vector shineV = calculateInsideS();
		KernelStored!Vector shineMask = min(literal(Vector(1)), pow(shineV, minRadius - Vector(2)));
		KernelStored!Vector reflectionMask = pow(inside.component!"z", literal(Vector(2)));

		auto border = calculateMaskB();
		output(mix(
			sample(kback, uv),
			((refracted * transmission
			+ reflected * reflection * reflectionMask
			+ emission
			) * (Vector(1)-(streak * shineMask)) + shine * streak * shineMask) * border + kborder * (Vector(1) - border),
			mask,
		));
	}});
}
