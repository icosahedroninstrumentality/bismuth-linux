module bismuth.effect.stroke;

import bismuth;
import std.math;

public struct CubicBezier {
	Vector2 p0;
	Vector2 p1;
	Vector2 p2;
	Vector2 p3;
}

public void drawStroke (
	Stroke[] strokes,
	Color albedo,
	Color emission,
	Texture source = Texture.screen,
	Texture target = Texture.screen,
) {
	Vector4 region = Vector4(float.infinity, float.infinity, -float.infinity, -float.infinity);

	foreach (Stroke stroke; strokes) {
		import std.algorithm;
		region.x = min(region.x, stroke.bezier.p0.x - stroke.radius);
		region.x = min(region.x, stroke.bezier.p1.x - stroke.radius);
		region.x = min(region.x, stroke.bezier.p2.x - stroke.radius);
		region.x = min(region.x, stroke.bezier.p3.x - stroke.radius);
		region.y = min(region.y, stroke.bezier.p0.y - stroke.radius);
		region.y = min(region.y, stroke.bezier.p1.y - stroke.radius);
		region.y = min(region.y, stroke.bezier.p2.y - stroke.radius);
		region.y = min(region.y, stroke.bezier.p3.y - stroke.radius);
		region.z = max(region.z, stroke.bezier.p0.x + stroke.radius);
		region.z = max(region.z, stroke.bezier.p1.x + stroke.radius);
		region.z = max(region.z, stroke.bezier.p2.x + stroke.radius);
		region.z = max(region.z, stroke.bezier.p3.x + stroke.radius);
		region.w = max(region.w, stroke.bezier.p0.y + stroke.radius);
		region.w = max(region.w, stroke.bezier.p1.y + stroke.radius);
		region.w = max(region.w, stroke.bezier.p2.y + stroke.radius);
		region.w = max(region.w, stroke.bezier.p3.y + stroke.radius);
	}
	// Now region = (minX, minY, maxX, maxY)
	// Convert to (minX, minY, width, height)
	float width = region.z - region.x;
	float height = region.w - region.y;
	region.z = width;
	region.w = height;

	drawStroke(strokes, albedo, emission, source, target, region);
}

public void drawStroke (
	Stroke[] strokes,
	Color albedo,
	Color emission,
	Texture source = Texture.screen,
	Texture target = Texture.screen,
	Vector4 region,
) {
	// Ensure temporary textures match current screen size (lazy init / resize)
	if (back is null || back.size != screenSize) back = new Texture(screenSize);
	drawCopy(CopyInstruction(region, source, region, back));
	
	uback.set(back);
	ucount.set(cast (int) (strokes.length));
	uemission.set(emission);
	ualbedo.set(albedo);
	
	CubicBezier[] beziers = [];
	foreach (Stroke stroke; strokes) beziers ~= stroke.bezier;
	upositions.set(cast (Vector2[]) cast (Vector[]) beziers);
	
	Vector[] radii = [];
	Vector[] radii2 = [];
	foreach (Stroke stroke; strokes) {
		radii ~= stroke.radius;
		radii2 ~= stroke.radius * stroke.radius;
	}
	uradii.set(radii);
	uradii2.set(radii2);
	
	shader.draw(
		target,
		region,
	);
}

private Shader shader;

private Uniform!int ucount;
private Uniform!(Vector2[]) upositions;
private Uniform!(Vector[]) uradii;
private Uniform!(Vector[]) uradii2;

private Uniform!Vector4 ualbedo;
private Uniform!Vector4 uemission;
private Uniform!Texture uback;

private Texture back;

public void initStroke () {
	shader = new Shader(`#version 330 core
	precision highp float;

	in vec2 uv;
	out vec4 finalColor;

	uniform sampler2D back;

	uniform int count;
	uniform vec2[4096] beziers;
	uniform float[1024] radius;
	uniform float[1024] radius2;
	
	uniform vec4 albedo;
	uniform vec4 emission;

	const float EPS = 1e-9;

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

	float distance(vec2 Q, vec2 p0, vec2 p1, vec2 p2, vec2 p3) {
		const int SUBDIV_LEVELS = 3;
		const int SAMPLES_PER_LEVEL = 8;

		float t_low = 0.0;
		float t_high = 1.0;
		float best_t = 0.0;
		float best_d2 = 1e20;

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

		float t = best_t;
		const int ITER = 5;
		for (int j = 0; j < ITER; ++j) {
			vec2 B  = bezier_point(p0, p1, p2, p3, t);
			vec2 Bp = bezier_deriv(p0, p1, p2, p3, t);
			vec2 Bpp = bezier_deriv2(p0, p1, p2, p3, t);

			vec2 diff = B - Q;
			float g  = dot(diff, Bp);				 // f'(t)/2
			float gp = dot(Bp, Bp) + dot(diff, Bpp);  // f''(t)/2

			if (abs(gp) > EPS) {
				float step = g / gp;
				// ---- critical: prevent wild jumps ----
				step = clamp(step, -0.2, 0.2);
				t = t - step;
				t = clamp(t, 0.0, 1.0);
			} else {
				break;
			}
		}

		vec2 final_B = bezier_point(p0, p1, p2, p3, t);
		float d2_final = dot(final_B - Q, final_B - Q);

		// sharp curves often have their closest point at the start/end
		float d2_start = dot(p0 - Q, p0 - Q);
		float d2_end   = dot(p3 - Q, p3 - Q);

		return min(d2_final, min(d2_start, d2_end));
	}

	float calculateMask (vec2 Sposition) {
		float mask = 0;

		// Degenerate case: only one point
		if (count == 1.0) {
			float d = distance(Sposition, beziers[0], beziers[1], beziers[2], beziers[3]);
			return max(0.0, 1.0 - pow(d / radius2[0], radius[0]));
		}

		// Loop over all segments
		for (int i = 0; i < 1023; i++) {
			if (i >= count) break;
			float d = distance(
				Sposition,
				beziers[i * 4],
				beziers[i * 4 + 1],
				beziers[i * 4 + 2],
				beziers[i * 4 + 3]
			);
			// Replace hard min with smooth min
			mask = max(0.0, max(mask, 1.0 - pow(d / radius2[i], radius[i])));
		}

		return mask;
	};

	void main() {
		vec4 refracted = vec4(0.0);
		vec4 reflected = vec4(0.0);

		float mask = calculateMask(gl_FragCoord.xy);

		finalColor = mix(
			texture(back, uv),
			texture(back, uv) * albedo + emission,
			mask
		);
	}
	`);

	ucount = shader.uniform!int("count", 0);
	upositions = shader.uniform!(Vector2[])("beziers", []);
	uradii = shader.uniform!(Vector[])("radius", []);
	uradii2 = shader.uniform!(Vector[])("radius2", []);

	uemission = shader.uniform!Vector4("emission", Vector4.one);
	ualbedo = shader.uniform!Vector4("albedo", Vector4.one);

	uback = shader.uniform!Texture("back", back);
}
