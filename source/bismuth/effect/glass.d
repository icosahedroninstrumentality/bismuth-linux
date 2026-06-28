module bismuth.effect.glass;

import bismuth;
import std.math;

public struct Glass {
	Shape shape;
	Vector shineAngle = 0;
	Vector blur = 0.0;
	Color transmission = Color(0.75, 0.76, 0.77, 1.0);
	Color reflection = Color(0.75, 0.76, 0.77, 1.0);
	Color emission = Color(0.01, 0.02, 0.03, 1.0);
	Color shine = Vector4.one;//Color(0.51, 0.52, 0.53, 1.0);
	Vector refractivity = 1.0;
	Vector reflectivity = 1.0;
}

public void drawGlass (
	Glass glass,
	Texture source = Texture.screen,
	Texture target = Texture.screen
) {
	Vector4 region = Vector4(
		glass.shape.position.x - glass.shape.size.x,
		glass.shape.position.y - glass.shape.size.y,
		glass.shape.size.x * 2,
		glass.shape.size.y * 2,
	);

	Vector4 paddedRegion = region + Vector4(
		-glass.shape.radius.x * 4,
		-glass.shape.radius.y * 4,
		glass.shape.radius.x * 8,
		glass.shape.radius.y * 8,
	); // Add padding to ensure blur covers edges

	// Ensure temporary textures match current screen size (lazy init / resize)
	if (back is null || back.size != screenSize) back = new Texture(screenSize);
	if (blur is null || blur.size != screenSize) blur = new Texture(screenSize);
	
	drawCopy(CopyInstruction(paddedRegion, source, paddedRegion, back));
	if (glass.blur == 0) {
		drawCopy(CopyInstruction(paddedRegion, source, paddedRegion, blur));
	} else {
		drawBlur(BlurInstruction(paddedRegion, source, paddedRegion, blur, glass.blur));
	}

	uback.set(back);
	ublur.set(blur);

	uposition.set(glass.shape.position);
	usize.set(glass.shape.size);
	uradius.set(glass.shape.radius);
	upower.set((glass.shape.size * 2.0) / glass.shape.radius);

	import std.algorithm;
	Vector2 minRadiusSize = Vector2(
		min(glass.shape.radius.x * 2.0, glass.shape.size.x),
		min(glass.shape.radius.y * 2.0, glass.shape.size.y),
	);
	Vector minRadius = min(minRadiusSize.x, minRadiusSize.y);
	uminRadius.set(minRadius);
	
	ureflection.set(glass.reflection);
	uemission.set(glass.emission);
	utransmission.set(glass.transmission);
	ushine.set(glass.shine);

	urefractivity.set(glass.refractivity);
	ureflectivity.set(glass.reflectivity);

	Vector2 shineDir = Vector2(sin(glass.shineAngle), cos(glass.shineAngle)).normalize();
	if (shineDir.length == 0) shineDir = Vector2.one;
	ushineDir.set(shineDir);
	upx.set(Vector2(1, 1) / screenSize);
	
	shader.draw(
		target,
		region,
	);
}

private Shader shader;

private Uniform!Vector2 uposition;
private Uniform!Vector2 usize;
private Uniform!Vector2 uradius;
private Uniform!Vector2 upower;
private Uniform!Vector uminRadius;

private Uniform!Vector4 ureflection;
private Uniform!Vector4 uemission;
private Uniform!Vector4 utransmission;
private Uniform!Vector4 ushine;

private Uniform!Vector urefractivity;
private Uniform!Vector ureflectivity;

private Uniform!Vector2 ushineDir;
private Uniform!Vector2 upx;
private Uniform!Texture ublur;
private Uniform!Texture uback;

private Texture blur;
private Texture back;

public void initGlass () {
	shader = new Shader(`#version 330 core
	precision highp float;

	in vec2 uv;
	out vec4 finalColor;

	uniform vec2 position;
	uniform vec2 size;
	uniform vec2 radius;
	uniform float minRadius;
	uniform vec2 power;
	
	uniform vec4 reflection;
	uniform vec4 emission;
	uniform vec4 transmission;
	uniform vec4 shine;
	
	uniform float refractivity;
	uniform float reflectivity;
	
	uniform vec2 shineDir = vec2(1.0, 1.0);

	uniform vec2 px;

	uniform sampler2D blur;///min:l;mag:l;s:m;t:m;
	uniform sampler2D back;///min:l;mag:l;s:m;t:m;

	float calculateInside (vec2 Sposition) {
		vec2 d = pow(abs((Sposition - position) / size), power);
		return d.x + d.y;
	}

	float calculateMaskB (vec2 Sposition) {
		vec2 newPower = ((size - 1.0) * 2.0) / (radius - 1.0);
		vec2 d = pow(abs((Sposition - position) / (size - 1.0)), newPower);
		return 1.0 - min(1.0, pow(d.x + d.y, 0.5 * (minRadius - 1.0)));
	}

	float calculateInsideS (vec2 Sposition) {
		vec2 newPower = ((size - 2.0) * 2.0) / (radius - 2.0);
		vec2 d = pow(abs((Sposition - position) / (size - 2.0)), newPower);
		return min(1.0, d.x + d.y);
	}

	void main() {
		vec4 refracted = vec4(0.0);
		vec4 reflected = vec4(0.0);

		vec3 inside;

		inside.z = calculateInside(gl_FragCoord.xy);
		if (inside.z > 1.0) { finalColor = texture(back, uv); return; }
		inside.x = calculateInside(gl_FragCoord.xy + vec2(1.0,0.0));
		inside.y = calculateInside(gl_FragCoord.xy + vec2(0.0,1.0));

		float mask = max(0.0, 1.0 - pow(inside.z, 0.5 * minRadius));

		vec2 grad = vec2(inside.x - inside.z, inside.y - inside.z);
		vec2 dir_ = normalize(grad + 1e-5);

		vec2 offsetR = dir_ * pow(      inside.z, 2.0) * px * minRadius * refractivity;
		vec2 offsetL = dir_ * pow(1.0 - inside.z, 2.0) * px * minRadius * reflectivity;

		refracted.r = texture(blur, uv - offsetR).r;
		refracted.g = texture(blur, uv - offsetR * 0.9).g;
		refracted.b = texture(blur, uv - offsetR * 0.9 * 0.9).b;

		refracted.a = 1.0;

		reflected.r = texture(blur, uv + offsetL).r;
		reflected.g = texture(blur, uv + offsetL * 0.9).g;
		reflected.b = texture(blur, uv + offsetL * 0.9 * 0.9).b;

		reflected.a = 1.0;

		float streak = pow(abs(dot(dir_, shineDir)), 3.14);

		float shineV = calculateInsideS(gl_FragCoord.xy);
		float shineMask = 2.0 * min(1.0, pow(shineV, (minRadius - 2.0) * 0.5));
		float reflectionMask = pow(inside.z, 2.0);

		finalColor = mix(
			texture(back, uv),
			(
				refracted * transmission
				+ reflected * reflection * reflectionMask
				+ emission
				+ shine * streak * shineMask
			) * calculateMaskB(gl_FragCoord.xy),
			mask
		);
	}
	`);

	uposition = shader.uniform!Vector2("position", Vector2.zero);
	usize = shader.uniform!Vector2("size", Vector2.zero);
	uradius = shader.uniform!Vector2("radius", Vector2.zero);
	upower = shader.uniform!Vector2("power", Vector2.zero);
	uminRadius = shader.uniform!Vector("minRadius", 0);

	ureflection = shader.uniform!Vector4("reflection", Vector4.one);
	uemission = shader.uniform!Vector4("emission", Vector4.one);
	utransmission = shader.uniform!Vector4("transmission", Vector4.one);
	ushine = shader.uniform!Vector4("shine", Vector4.one);

	urefractivity = shader.uniform!Vector("refractivity", 0.0);
	ureflectivity = shader.uniform!Vector("reflectivity", 0.0);

	ushineDir = shader.uniform!Vector2("shineDir", Vector2.zero);
	upx = shader.uniform!Vector2("px", Vector2.zero);
	ublur = shader.uniform!Texture("blur", blur);
	uback = shader.uniform!Texture("back", back);
}