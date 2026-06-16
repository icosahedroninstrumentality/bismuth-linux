module bismuth.effect.copy;

import bismuth;

private Shader shader;
private Uniform!Texture uTexture;
private Uniform!Vector4 uSourceRect;
private Uniform!Vector4 uTargetRect;

public struct CopyInstruction {
	Vector4 sourceRect;
	Texture source;
	Vector4 targetRect;
	Texture target;
}

public void drawCopy (CopyInstruction instruction) {
	uTexture.set(instruction.source);
	
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

	shader.draw(instruction.target, instruction.targetRect);
}

public void initCopy () {
	shader = new Shader(`#version 330 core
		precision highp float;
		in vec2 uv;
		out vec4 fragColor;

		uniform sampler2D uTexture;
		uniform vec4 sourceRect;
		uniform vec4 targetRect;

		void main() {
			vec2 texCoord = mix(sourceRect.xy, sourceRect.zw, (gl_FragCoord.xy - targetRect.xy) / targetRect.zw);
			fragColor = texture(uTexture, texCoord);
		}
	`);

	uTexture = shader.uniform!Texture("uTexture", a);
	uSourceRect = shader.uniform!Vector4("sourceRect", Vector4(0.0, 0.0, 1.0, 1.0));
	uTargetRect = shader.uniform!Vector4("targetRect", Vector4(0.0, 0.0, 1.0, 1.0));
}