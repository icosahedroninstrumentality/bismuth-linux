module bismuth.effect.shape;

import bismuth;
import std.math;

public void drawShape (
	Surface surface,
	Texture source = Texture.screen,
	Texture target = Texture.screen
) {
	Vector4 region = Vector4(
		surface.shape.position.x - surface.shape.size.x,
		surface.shape.position.y - surface.shape.size.y,
		surface.shape.size.x * 2,
		surface.shape.size.y * 2,
	);

	Vector4 paddedRegion = region + Vector4(
		-surface.shape.radius.x * 4,
		-surface.shape.radius.y * 4,
		surface.shape.radius.x * 8,
		surface.shape.radius.y * 8,
	);

	if (back is null || back.size != screenSize) back = new Texture(screenSize);
	
	drawCopy(CopyInstruction(paddedRegion, source, paddedRegion, back));

	uback.set(back);

	uposition.set(surface.shape.position);
	usize.set(surface.shape.size);
	uradius.set(surface.shape.radius);
	upower.set((surface.shape.size * 2.0) / surface.shape.radius);

	import std.algorithm;
	Vector2 minRadiusSize = Vector2(
		min(surface.shape.radius.x * 2.0, surface.shape.size.x),
		min(surface.shape.radius.y * 2.0, surface.shape.size.y),
	);
	Vector minRadius = min(minRadiusSize.x, minRadiusSize.y);
	uminRadius.set(minRadius);
	
	ualbedo.set(surface.albedo);
	uemission.set(surface.emission);

	uborder.set(surface.border.width);
	ubordercolor.set(surface.border.color);
	
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

private Uniform!Vector4 ualbedo;
private Uniform!Vector4 uemission;
private Uniform!Vector4 ubordercolor;

private Uniform!Vector2 upx;
private Uniform!Vector uborder;

private Uniform!Texture uback;

private Texture back;

public void initShape () {
	shader = new Shader(`#version 330 core
	precision highp float;

	in vec2 uv;
	out vec4 finalColor;

	uniform vec2 position;
	uniform vec2 size;
	uniform vec2 radius;
	uniform float minRadius;
	uniform vec2 power;
	
	uniform vec4 albedo;
	uniform vec4 emission;
	uniform vec4 bordercolor;

	uniform float border;

	uniform sampler2D back;///min:l;mag:l;s:m;t:m;

	float calculateInside (vec2 Sposition) {
		vec2 d = pow(abs((Sposition - position) / size), power);
		return d.x + d.y;
	}

	float calculateMaskB (vec2 Sposition) {
		vec2 newPower = ((size - border) * 2.0) / (radius - border);
		vec2 d = pow(abs((Sposition - position) / (size - border)), newPower);
		return min(1.0, pow(d.x + d.y, 0.5 * (minRadius - border)));
	}

	void main() {
		vec4 refracted = vec4(0.0);
		vec4 reflected = vec4(0.0);

		float inside = calculateInside(gl_FragCoord.xy);
		if (inside > 1.0) { finalColor = texture(back, uv); return; }
		float mask = max(0.0, 1.0 - pow(inside, 0.5 * minRadius));

		float bmask = calculateMaskB(gl_FragCoord.xy);
		finalColor = mix(
			texture(back, uv),
			(texture(back, uv) * albedo + emission) * (1.0 - bmask) + bordercolor * bmask,
			mask
		);
	}
	`);

	uposition = shader.uniform!Vector2("position", Vector2.zero);
	usize = shader.uniform!Vector2("size", Vector2.zero);
	uradius = shader.uniform!Vector2("radius", Vector2.zero);
	upower = shader.uniform!Vector2("power", Vector2.zero);
	uminRadius = shader.uniform!Vector("minRadius", 0);

	ualbedo = shader.uniform!Vector4("albedo", Vector4.one);
	uemission = shader.uniform!Vector4("emission", Vector4.one);
	ubordercolor = shader.uniform!Vector4("bordercolor", Vector4.one);

	uborder	= shader.uniform!Vector("border", 0);

	uback = shader.uniform!Texture("back", back);
}