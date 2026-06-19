module bismuth.effect.glass_stroke;

import bismuth;
import std.math;

public struct CubicBezier {
	Vector2 p0;
	Vector2 p1;
	Vector2 p2;
	Vector2 p3;
}

public struct GlassStroke {
	CubicBezier[] beziers;
	float radius;
	Vector shineAngle = 0;
	Color transmission = Color(0.95, 0.96, 0.97, 1.0);
	Color reflection = Color(0.35, 0.36, 0.37, 1.0);
	Color emission = Color(0.01, 0.02, 0.03, 1.0);
	Color shine = Color(0.51, 0.52, 0.53, 1.0);
}

public void drawGlassStroke (
	GlassStroke glass,
	Texture source,
	Texture target = Texture.screen
) {
	Vector4 region = Vector4(float.infinity, float.infinity, -float.infinity, -float.infinity);

	foreach (CubicBezier bezier; glass.beziers) {
		import std.algorithm;
		region.x = min(region.x, bezier.p0.x);
		region.x = min(region.x, bezier.p1.x);
		region.x = min(region.x, bezier.p2.x);
		region.x = min(region.x, bezier.p3.x);
		
		region.y = min(region.y, bezier.p0.y);
		region.y = min(region.y, bezier.p1.y);
		region.y = min(region.y, bezier.p2.y);
		region.y = min(region.y, bezier.p3.y);

		region.z = max(region.z, bezier.p0.x);
		region.z = max(region.z, bezier.p1.x);
		region.z = max(region.z, bezier.p2.x);
		region.z = max(region.z, bezier.p3.x);
		
		region.w = max(region.w, bezier.p0.y);
		region.w = max(region.w, bezier.p1.y);
		region.w = max(region.w, bezier.p2.y);
		region.w = max(region.w, bezier.p3.y);

	}

	// Now region = (minX, minY, maxX, maxY)
	// Convert to (minX, minY, width, height)
	float width = region.z - region.x;
	float height = region.w - region.y;
	region.z = width;
	region.w = height;

	Vector4 paddedRegion = region + Vector4(
		-glass.radius * 4,
		-glass.radius * 4,
		glass.radius * 8,
		glass.radius * 8,
	); // Add padding to ensure blur covers edges

	// Ensure temporary textures match current screen size (lazy init / resize)
	if (back is null || back.size != screenSize) {
		back = new Texture(screenSize);
	}
	if (blur is null || blur.size != screenSize) {
		blur = new Texture(screenSize);
	}

	drawCopy(CopyInstruction(
		paddedRegion * (source.size / back.size), source,
		paddedRegion, back,
	));

	uback.set(back);
	
	drawCopy(CopyInstruction(
		paddedRegion * (source.size / blur.size), source,
		paddedRegion, blur,
	));

	ublur.set(blur);
	
	upositions.set(cast (Vector2[]) cast (Vector[]) glass.beziers);
	ucount.set(cast (int) (glass.beziers.length));
	uradius.set(glass.radius);

	ureflection.set(glass.reflection);
	uemission.set(glass.emission);
	utransmission.set(glass.transmission);
	ushine.set(glass.shine);

	Vector2 shineDir = Vector2(cos(glass.shineAngle), sin(glass.shineAngle)).normalize();
	if (shineDir.length == 0) shineDir = Vector2.one;
	ushineDir.set(shineDir);
	upx.set(Vector2(1, 1) / screenSize);
	
	shader.draw(
		target,
		paddedRegion,
	);
}

private Shader shader;

private Uniform!(Vector2[]) upositions;
private Uniform!int ucount;
private Uniform!float uradius;

private Uniform!Vector4 ureflection;
private Uniform!Vector4 uemission;
private Uniform!Vector4 utransmission;
private Uniform!Vector4 ushine;

private Uniform!Vector2 ushineDir;
private Uniform!Vector2 upx;
private Uniform!Texture ublur;
private Uniform!Texture uback;

private Texture blur;
private Texture back;

public void initGlassStroke () {
	shader = new Shader(`#version 330 core
	precision highp float;

	in vec2 uv;
	out vec4 finalColor;

	uniform sampler2D back;
	uniform sampler2D blur;

	uniform vec2[1024] beziers;
	uniform int count;
	uniform float radius;
	
	uniform vec4 reflection;
	uniform vec4 emission;
	uniform vec4 transmission;
	uniform vec4 shine;
	
	uniform vec2 shineDir = vec2(1.0, 1.0);

	uniform vec2 px;

	const float EPS = 1e-9;

// ----------------------------------------------------------------------------
// Cubic Bézier evaluation and derivatives (all inlined for performance)
// ----------------------------------------------------------------------------

vec2 bezier_point(vec2 p0, vec2 p1, vec2 p2, vec2 p3, float t) {
    float u = 1.0 - t;
    float u2 = u * u;
    float t2 = t * t;
    return u2 * u * p0 + 3.0 * u2 * t * p1 + 3.0 * u * t2 * p2 + t2 * t * p3;
}

vec2 bezier_deriv(vec2 p0, vec2 p1, vec2 p2, vec2 p3, float t) {
    float u = 1.0 - t;
    float u2 = u * u;
    float t2 = t * t;
    return 3.0 * u2 * (p1 - p0) + 6.0 * u * t * (p2 - p1) + 3.0 * t2 * (p3 - p2);
}

vec2 bezier_deriv2(vec2 p0, vec2 p1, vec2 p2, vec2 p3, float t) {
    float u = 1.0 - t;
    vec2 a = p2 - 2.0 * p1 + p0;
    vec2 b = p3 - 2.0 * p2 + p1;
    return 6.0 * u * a + 6.0 * t * b;
}

// ----------------------------------------------------------------------------
// Main distance function (8 samples + 4 Newton iterations)
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// Robust distance to cubic Bézier (hierarchical sampling + damped Newton)
// ----------------------------------------------------------------------------

float distance(vec2 Q, vec2 p0, vec2 p1, vec2 p2, vec2 p3) {
    const int SUBDIV_LEVELS = 3;
    const int SAMPLES_PER_LEVEL = 8;
    const float EPS = 1e-8;

    float t_low = 0.0;
    float t_high = 1.0;
    float best_t = 0.0;
    float best_d2 = 1e20;

    // ---- 1) Coarse‑to‑fine hierarchical search ----
    for (int level = 0; level < SUBDIV_LEVELS; ++level) {
        float span = t_high - t_low;
        float local_best_t = t_low;
        float local_best_d2 = 1e20;

        // sample the current interval
        for (int i = 0; i <= SAMPLES_PER_LEVEL; ++i) {
            float t = t_low + span * float(i) / float(SAMPLES_PER_LEVEL);
            vec2 B = bezier_point(p0, p1, p2, p3, t);
            float d2 = dot(B - Q, B - Q);
            if (d2 < local_best_d2) {
                local_best_d2 = d2;
                local_best_t = t;
            }
        }

        // keep the global best
        if (local_best_d2 < best_d2) {
            best_d2 = local_best_d2;
            best_t = local_best_t;
        }

        // narrow the search interval around the best point of this level
        float half_width = span / float(SAMPLES_PER_LEVEL) * 0.8; // 0.8 gives overlap
        t_low = max(0.0, local_best_t - half_width);
        t_high = min(1.0, local_best_t + half_width);
    }

    // ---- 2) Damped Newton refinement ----
    float t = best_t;
    const int ITER = 5;
    for (int j = 0; j < ITER; ++j) {
        vec2 B  = bezier_point(p0, p1, p2, p3, t);
        vec2 Bp = bezier_deriv(p0, p1, p2, p3, t);
        vec2 Bpp = bezier_deriv2(p0, p1, p2, p3, t);

        vec2 diff = B - Q;
        float g  = dot(diff, Bp);                 // f'(t)/2
        float gp = dot(Bp, Bp) + dot(diff, Bpp);  // f''(t)/2

        if (abs(gp) > EPS) {
            float step = g / gp;
            // ---- critical: prevent wild jumps ----
            step = clamp(step, -0.2, 0.2);
            t = t - step;
            t = clamp(t, 0.0, 1.0);
        } else {
            break; // flat region – no reliable second derivative
        }
    }

    // ---- 3) Final distance (including endpoint check) ----
    vec2 final_B = bezier_point(p0, p1, p2, p3, t);
    float d2_final = dot(final_B - Q, final_B - Q);

    // sharp curves often have their closest point at the start/end
    float d2_start = dot(p0 - Q, p0 - Q);
    float d2_end   = dot(p3 - Q, p3 - Q);

    return sqrt(min(d2_final, min(d2_start, d2_end)));
}

float smin(float a, float b, float k) {
    float h = clamp(0.5 + 0.5 * (b - a) / k, 0.0, 1.0);
    return mix(b, a, h);
}


float calculateInside(vec2 Sposition) {
	float minDist = 2.0; // initial sentinel
    float k = 3.0 / radius; // smoothing radius as requested

    // Loop over all segments
    for (int i = 0; i < 1023; i++) {
        if (i >= count) break;
        float d = distance(
			Sposition,
			beziers[i * 4],
			beziers[i * 4 + 1],
			beziers[i * 4 + 2],
			beziers[i * 4 + 3]
		) / radius;
        // Replace hard min with smooth min
        minDist = smin(minDist, d, k);
    }

    // Degenerate case: only one point
    if (count == 1) {
        minDist = distance(Sposition, beziers[0], beziers[1], beziers[2], beziers[3]) / radius;
    }

    return minDist;
	};

	void main() {
		vec4 refracted = vec4(0.0);
		vec4 reflected = vec4(0.0);

		vec3 inside;

		inside.z = calculateInside(gl_FragCoord.xy);
		if (inside.z > 1.0) { finalColor = texture(back, uv); return; }
		inside.x = calculateInside(gl_FragCoord.xy + vec2(1.0,0.0));
		inside.y = calculateInside(gl_FragCoord.xy + vec2(0.0,1.0));

		float mask = max(0.0, 1.0 - pow(inside.z, 0.5 * radius));

		vec2 grad = vec2(inside.x - inside.z, inside.y - inside.z);
		vec2 dir_ = normalize(grad + 1e-5);

		vec2 offsetR = dir_ * pow(      inside.z, 3.14) * px * 1.14473 * radius * 1.0;
		vec2 offsetL = dir_ * pow(1.0 - inside.z, 3.14) * px * 1.14473 * radius * 2.0;

		refracted.r = texture(blur, uv - offsetR).r;
		refracted.g = texture(blur, uv - offsetR * 0.9).g;
		refracted.b = texture(blur, uv - offsetR * 0.9 * 0.9).b;

		refracted.a = 1.0;

		reflected.r = texture(blur, uv + 2.0 * offsetL).r;
		reflected.g = texture(blur, uv + 2.0 * offsetL * 0.9).g;
		reflected.b = texture(blur, uv + 2.0 * offsetL * 0.9 * 0.9).b;

		reflected.a = 1.0;

		float streak = 2.0 * (0.5 - pow(abs(dot(dir_, shineDir)), 2.0));
		float shineCurve = pow(inside.z, 0.25 * radius);

		finalColor = mix(
			texture(back, uv),
			refracted * transmission
			+ reflected * pow(inside.z, radius * 0.125) * reflection
			+ emission
			+ shine * streak * shineCurve,
			mask
		);
	}
	`);

	upositions = shader.uniform!(Vector2[])("beziers", []);
	ucount = shader.uniform!int("count", 0);
	uradius = shader.uniform!float("radius", 0);

	ureflection = shader.uniform!Vector4("reflection", Vector4.one);
	uemission = shader.uniform!Vector4("emission", Vector4.one);
	utransmission = shader.uniform!Vector4("transmission", Vector4.one);
	ushine = shader.uniform!Vector4("shine", Vector4.one);

	ushineDir = shader.uniform!Vector2("shineDir", Vector2.zero);
	upx = shader.uniform!Vector2("px", Vector2.zero);
	ublur = shader.uniform!Texture("blur", blur);
	uback = shader.uniform!Texture("back", back);
}