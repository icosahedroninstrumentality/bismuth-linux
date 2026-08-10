module bismuth.effect.glass;

import bismuth.framework;
import bismuth.effect.blur;
import bismuth.effect.copy;
import std.math;

public class Glass {
	private __gshared Kernel kernel;

	private __gshared KernelParameter!Vector2 kposition;
	private __gshared KernelParameter!Vector2 kinvSize;
	private __gshared KernelParameter!Vector2 kpower;
	private __gshared KernelParameter!Vector2 ksize;
	private __gshared KernelParameter!Vector2 kcorner;
	private __gshared KernelParameter!Radian  kminRadius;
	private __gshared KernelParameter!Vector4 kreflection;
	private __gshared KernelParameter!Vector4 kemission;
	private __gshared KernelParameter!Vector4 ktransmission;
	private __gshared KernelParameter!Vector4 kshine;
	private __gshared KernelParameter!Vector2 krotate;
	private __gshared KernelParameter!Vector2 kshineDir;
	private __gshared KernelParameter!Vector2 kpx;
	private __gshared KernelParameter!Texture kback;
	private __gshared KernelParameter!Texture ktrr;
	private __gshared KernelParameter!Texture ktrl;
	private __gshared KernelParameter!Vector4 kborder;
	private __gshared KernelParameter!Radian kborderw;

	private __gshared Texture back;
	private __gshared Texture trr;
	private __gshared Texture trl;

	private shared static this () {
		kernel = new Kernel((Kernel k) { with (k) {
			kposition = uniform!Vector2();
			ksize = uniform!Vector2();
			kinvSize = uniform!Vector2();
			kcorner = uniform!Vector2();
			kpower = uniform!Vector2();
			kminRadius = uniform!Radian();
			kreflection = uniform!Vector4();
			kemission = uniform!Vector4();
			ktransmission = uniform!Vector4();
			kshine = uniform!Vector4();
			krotate = uniform!Vector2();
			kshineDir = uniform!Vector2();
			kpx = uniform!Vector2();
			kback = uniform!Texture();
			ktrr = uniform!Texture();
			ktrl = uniform!Texture();
			kborder = uniform!Vector4();
			kborderw = uniform!Radian();
			
			KernelStored!Radian calculateMaskB() {
				return Radian.one - min(
					(Radian.one),
					shapeMask(k, calculateShape(k,
						coord.component!"xy", kposition,
						Radian.one / (ksize - kborderw),
						((ksize - kborderw) * Radian.two) / (kcorner - kborderw),
						krotate,
					), kminRadius - kborderw)
				);
			}
	
			KernelStored!Radian calculateInsideS () {
				return calculateShape(k,
					coord.component!"xy", kposition,
					Radian.one / (ksize - Radian(2.5)),
					((ksize - Radian(2.5)) * Radian.two) / (kcorner - Radian(2.5) + EPS),
					krotate,
				);
			}
	
			KernelStored!Radian i = calculateShape(k,
				coord.component!"xy", kposition, kinvSize, kpower, krotate
			);
			earlyOutput(op!bool(i, ">", Radian.one), sample(kback, uv));
			KernelStored!Vector3 inside = compose(
				calculateShape(k, coord.component!"xy" + Vector2(Radian.one, Radian.zero), kposition, kinvSize, kpower, krotate),
				calculateShape(k, coord.component!"xy" + Vector2(Radian.zero, Radian.one), kposition, kinvSize, kpower, krotate),
				i,
			);
			KernelStored!Radian mask = max((Radian.zero), Radian.one - shapeMask(k, inside.component!"z", kminRadius));
			KernelStored!Radian curvature = pow(inside.component!"z", (Radian.two));
	
			KernelStored!Vector2 grad = compose(inside.component!"x" - inside.component!"z", inside.component!"y" - inside.component!"z");
			KernelStored!Vector2 dir_ = normalize(grad + EPS);
			KernelStored!Vector2 offsetR = dir_ * curvature * kpx * kcorner * Radian.one;
			KernelStored!Vector2 offsetL = dir_ * (Radian.one - curvature) * kpx * kcorner * Radian.two;
	
			KernelStored!Vector2 abberation = max(Vector2(Radian(0.5), Radian(0.5)), Radian(1.0) - Radian(6.0) / (kcorner + EPS));
	
			KernelStored!Vector4 refracted = compose(
				sample(ktrr, uv - offsetR).component!"r",
				sample(ktrr, uv - offsetR * abberation).component!"g",
				sample(ktrr, uv - offsetR * abberation * abberation).component!"b",
				(Radian.one),
			);
	
			KernelStored!Vector4 reflected = compose(
				sample(ktrl, uv + offsetL).component!"r",
				sample(ktrl, uv + offsetL * abberation).component!"g",
				sample(ktrl, uv + offsetL * abberation * abberation).component!"b",
				(Radian.one),
			);
	
			KernelStored!Radian streak = pow(abs(dot(dir_, kshineDir)), PI);
			KernelStored!Radian shineV = calculateInsideS();
			KernelStored!Radian shineMask = min((Radian.one), pow(shineV, kminRadius - Radian(2.5)));
	
			auto border = calculateMaskB();
			output(mix(
				sample(kback, uv),
				mix(
					kborder,
					mix(
						refracted * ktransmission,
						reflected * kreflection,
						curvature,
					)
					+ kemission
					+ kshine * streak * shineMask,
					border,
				),
				mask,
			));
		}});
	}

	public Shape shape = Shape(Vector2.zero, Vector2.zero, Vector2.zero, Degree(0));
	public Degree shineAngle = 0;
	public Radian blur = 0.0;
	public Vector4 transmission = OKLCHA(Radian(0.95), Radian(0.01), Degree(180), Radian.one);
	public Vector4 reflection =   OKLCHA(Radian(0.95), Radian(0.01), Degree(180), Radian.one);
	public Vector4 emission =     OKLCHA(Radian(0.05), Radian(0.01), Degree(180), Radian.one);
	public Vector4 shine = Vector4.one;//Vector4(0.51, 0.52, 0.53, 1.0);
	public Border border = Border(Radian(1), OKLCHA.black);//Vector4(0.51, 0.52, 0.53, 1.0);

	public void draw (
		Texture _back = Texture.screen,
		Texture _trr = Texture.screen,
		Texture _trl = Texture.screen,
		Texture target = Texture.screen
	) {
		if (shape.size == Vector2.zero) return;
		import std.algorithm;
		Radian maxSize = max(shape.size.x, shape.size.y);
		Vector4 region = (shape.angle == Degree(0)) ? Vector4(
			shape.position.x - shape.size.x,
			shape.position.y - shape.size.y,
			shape.size.x * Radian.two,
			shape.size.y * Radian.two,
		) : Vector4(
			shape.position.x - maxSize,
			shape.position.y - maxSize,
			maxSize * Radian.two,
			maxSize * Radian.two,
		);

		Vector4 regionL = region + Vector4(
			-shape.radius.x * Radian.two, -shape.radius.y * Radian.two,
			 shape.radius.x * Radian(4),  shape.radius.y * Radian(4),
		);

		// Ensure temporary textures match current screen size (lazy init / resize)
		if (back is null || back.size != Texture.screen.size) back = new Texture(Texture.screen.size);
		if (trr is null || trr.size != Texture.screen.size) trr = new Texture(Texture.screen.size);
		if (trl is null || trl.size != Texture.screen.size) trl = new Texture(Texture.screen.size);

		Copy.draw(region, _back, region, back);


		if (blur == Radian.zero) Copy.draw(regionL, _trl, regionL, trl);
		else Blur.draw(_trl, regionL, trl, regionL, blur);
		if (_trl == _trr) {
			Copy.draw(region,  trl, region,  trr);
		} else {
			if (blur == Radian.zero) Copy.draw(region,  _trr, region,  trr);
			else Blur.draw(_trr, region, trr, region, blur);
		}

		kback.set(back);
		ktrr.set(trr);
		ktrl.set(trl);

		kposition.set(shape.position);
		ksize.set(shape.size);
		kinvSize.set(Vector2.one / shape.size);
		kcorner.set(shape.radius);
		kpower.set(((shape.size * Radian.two) / (shape.radius + Radian.epsilon)).max(Vector2.zero));

		kminRadius.set(min(shape.radius.x, shape.radius.y));

		kreflection.set(reflection.opaque);
		kemission.set(emission.opaque);
		ktransmission.set(transmission.opaque);
		kshine.set(shine.opaque);
		krotate.set(shape.angle.direction);
		kborder.set(border.color);
		kborderw.set(border.width);

		kshineDir.set(shineAngle.direction);
		kpx.set(Vector2.one / Texture.screen.size);

		kernel.draw(
			target,
			region,
		);
	}
}
