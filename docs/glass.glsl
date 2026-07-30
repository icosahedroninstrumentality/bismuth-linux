#version 330 core
precision highp float;

in vec2 uv;
out vec4 finalColor;

uniform vec2 position;
uniform vec2 size;
uniform vec2 radius;
uniform float minRadius;
uniform vec2 power;
uniform float angle;

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
	vec2 offset = Sposition - position;
	float cosA = cos(angle);
	float sinA = sin(angle);
	vec2 rotatedOffset = vec2(offset.x * cosA - offset.y * sinA,
					offset.x * sinA + offset.y * cosA);
	vec2 d = pow(abs(rotatedOffset / size), power);
	return d.x + d.y;
}

float calculateMaskB (vec2 Sposition) {
	vec2 newPower = ((size - 1.0) * 2.0) / (radius - 1.0);
	vec2 offset = Sposition - position;
	float cosA = cos(angle);
	float sinA = sin(angle);
	vec2 rotatedOffset = vec2(offset.x * cosA - offset.y * sinA,
					offset.x * sinA + offset.y * cosA);
	vec2 d = pow(abs(rotatedOffset / (size - 1.0)), newPower);
	return 1.0 - min(1.0, pow(d.x + d.y, 0.5 * (minRadius - 1.0)));
}

float calculateInsideS (vec2 Sposition) {
	vec2 newPower = ((size - 2.0) * 2.0) / (radius - 2.0);
	vec2 offset = Sposition - position;
	float cosA = cos(angle);
	float sinA = sin(angle);
	vec2 rotatedOffset = vec2(offset.x * cosA - offset.y * sinA,
					offset.x * sinA + offset.y * cosA);
	vec2 d = pow(abs(rotatedOffset / (size - 2.0)), newPower);
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

	vec2 offsetR = dir_ * pow(inside.z, 2.0)         * px * minRadius * refractivity;
	vec2 offsetL = dir_ * (1.0 - pow(inside.z, 2.0)) * px * minRadius * reflectivity;

	vec2 abberation = max(vec2(0.5), 1.0 - 6.0 / radius);
	vec2 abberationR = abberation / refractivity;
	vec2 abberationL = abberation / reflectivity;

	vec4 refracted = vec4(
		texture(blur, uv - offsetR).r,
		texture(blur, uv - offsetR * abberationR).g,
		texture(blur, uv - offsetR * abberationR * abberationR).b,
		1.0,
	);

	vec4 reflected = vec4(
		texture(blur, uv + offsetL).r,
		texture(blur, uv + offsetL * abberationL).g,
		texture(blur, uv + offsetL * abberationL * abberationL).b,
		1.0,
	);

	float streak = pow(abs(dot(dir_, shineDir)), 3.14);

	float shineV = calculateInsideS(gl_FragCoord.xy);
	float shineMask = min(1.0, pow(shineV, (minRadius - 2.0) * 0.5));
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
