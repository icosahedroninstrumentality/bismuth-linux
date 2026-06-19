module bismuth.effect.blur;

import bismuth;

private Shader shader;
private Uniform!Texture uTexture;
private Uniform!Vector4 uSourceRect;
private Uniform!Vector4 uTargetRect;
private Uniform!Vector uradius;
private Uniform!Vector2 uangle;
private Uniform!int usamples;
private Uniform!Vector2 upx;

private Texture a;
private Texture b;

import std.math;
import std.algorithm;

public struct BlurInstruction {
	Vector4 sourceRect;
	Texture source;
	Vector4 targetRect;
	Texture target;
	Vector radius;
	Vector angle;
	int samples = 0;
}

private void drawBlur_ (BlurInstruction instruction) {
	uTexture.set(instruction.source);
	int samples = instruction.samples;
	if (samples == 0) samples = cast (int) (max(1, ceil(instruction.radius * 0.25)) * 2);
	
	// Convert sourceRect from pixel coordinates to normalized texture coordinates
	Vector2 sourceSize = instruction.source.size;
	Vector4 normalizedSourceRect = Vector4(
		instruction.sourceRect.x / sourceSize.x,
		instruction.sourceRect.y / sourceSize.y,
		(instruction.sourceRect.x + instruction.sourceRect.z) / sourceSize.x,
		(instruction.sourceRect.y + instruction.sourceRect.w) / sourceSize.y
	);
	uSourceRect.set(normalizedSourceRect);
	uTargetRect.set(instruction.targetRect);
	uradius.set(instruction.radius);
	uangle.set(Vector2(sin(instruction.angle), cos(instruction.angle)));
	usamples.set(samples);
	upx.set(Vector2(1.0, 1.0) / instruction.source.size);

	shader.draw(instruction.target, instruction.targetRect);
}

public void drawBlur (BlurInstruction instruction) {
	if (a is null || a.size != screenSize) a = new Texture(screenSize);
	if (b is null || b.size != screenSize) b = new Texture(screenSize);
	Vector4 spad = instruction.sourceRect + Vector4(-instruction.radius, -instruction.radius, instruction.radius * 2, instruction.radius * 2);
	Vector4 tpad = instruction.targetRect + Vector4(-instruction.radius, -instruction.radius, instruction.radius * 2, instruction.radius * 2);
	drawBlur_(BlurInstruction(spad, instruction.source, tpad, a, instruction.radius, 0));
	drawBlur_(BlurInstruction(spad, a, tpad, b, instruction.radius, PI * 0.333));
	drawBlur_(BlurInstruction(instruction.sourceRect, b, instruction.targetRect, instruction.target, instruction.radius, PI * 0.666));
}

public void initBlur () {
	shader = new Shader(`#version 330 core
		precision highp float;
		in vec2 uv;
		out vec4 finalColor;

		uniform sampler2D uTexture;
		uniform vec4 sourceRect;
		uniform vec4 targetRect;
		uniform vec2 px;
		
		uniform float radius;
		uniform vec2 angle;
		uniform int samples;

		#define MAX_SAMPLES 256

		void main() {
			vec2 texCoord = mix(sourceRect.xy, sourceRect.zw, (gl_FragCoord.xy - targetRect.xy) / targetRect.zw);
			vec4 blurred = vec4(0.0);

			for (int i = 0; i < MAX_SAMPLES; i++) {
				if (i >= samples) break;
		
				float t = (float(i) + 0.5) / float(samples);
				float currentRadius = radius * (1.0 - t);
				vec2 offset = angle * px * currentRadius;
		
				blurred += texture(uTexture, texCoord + offset);
				blurred += texture(uTexture, texCoord - offset);
			}
		
			finalColor = blurred / float(samples * 2);
		}
	`);

	uTexture = shader.uniform!Texture("uTexture", a);
	uSourceRect = shader.uniform!Vector4("sourceRect", Vector4(0.0, 0.0, 1.0, 1.0));
	uTargetRect = shader.uniform!Vector4("targetRect", Vector4(0.0, 0.0, 1.0, 1.0));
	uradius = shader.uniform!Vector("radius", 0);
	uangle = shader.uniform!Vector2("angle", Vector2(0, 0));
	usamples = shader.uniform!int("samples", 0);
	upx = shader.uniform!Vector2("px", Vector2(0, 0));
}