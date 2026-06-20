module bismuth.hi;

import bismuth;

void drawHi (Vector2 position, Vector alpha) {
	Vector size = 300;
	drawGlassStroke(
		GlassStroke(
			([
				CubicBezier(
				    Vector2(position.x - size * 0.2, position.y + size * 0.0),
				    Vector2(position.x + size * 0.2, position.y + size * 0.2),
				    Vector2(position.x + size * 0.7, position.y + size * 0.9),
				    Vector2(position.x + size * 0.4, position.y + size * 0.9),
				),
				CubicBezier(
				    Vector2(position.x + size * 0.4, position.y + size * 0.9),
				    Vector2(position.x + size * 0.2, position.y + size * 0.9),
				    Vector2(position.x + size * 0.2, position.y + size * 0.0),
				    Vector2(position.x + size * 0.2, position.y + size * 0.0),
				),
				CubicBezier(
				    Vector2(position.x + size * 0.2, position.y + size * 0.0),
				    Vector2(position.x + size * 0.3, position.y + size * 0.4),
				    Vector2(position.x + size * 0.5, position.y + size * 0.4),
				    Vector2(position.x + size * 0.5, position.y + size * 0.2),
				),
				CubicBezier(
				    Vector2(position.x + size * 0.5, position.y + size * 0.2),
				    Vector2(position.x + size * 0.5, position.y + size * 0.1),
				    Vector2(position.x + size * 0.5, position.y + size * 0.0),
				    Vector2(position.x + size * 0.6, position.y + size * 0.0),
				),
				CubicBezier(
				    Vector2(position.x + size * 0.6, position.y + size * 0.0),
				    Vector2(position.x + size * 0.7, position.y + size * 0.0),
				    Vector2(position.x + size * 0.8, position.y + size * 0.4),
				    Vector2(position.x + size * 0.8, position.y + size * 0.4),
				),
				CubicBezier(
				    Vector2(position.x + size * 0.8, position.y + size * 0.4),
				    Vector2(position.x + size * 0.8, position.y + size * 0.2),
				    Vector2(position.x + size * 0.8, position.y + size * 0.0),
				    Vector2(position.x + size * 0.9, position.y + size * 0.0),
				),
				CubicBezier(
				    Vector2(position.x + size * 0.9, position.y + size * 0.0),
				    Vector2(position.x + size * 1.0, position.y + size * 0.0),
				    Vector2(position.x + size * 1.1, position.y + size * 0.2),
				    Vector2(position.x + size * 1.2, position.y + size * 0.4),
				),
				CubicBezier(
				    Vector2(position.x + size * 0.85, position.y + size * 0.675),
				    Vector2(position.x + size * 0.85, position.y + size * 0.675),
				    Vector2(position.x + size * 0.85, position.y + size * 0.675),
				    Vector2(position.x + size * 0.85, position.y + size * 0.675),
				),
			]),
			18,
			alpha,
			8,
			Color(0.51, 0.52, 0.53, 1.0),
			Color(0.27, 0.28, 0.29, 1.0),
			Color(0.5, 0.5, 0.5, 1.0),
			Vector4.one,
			4.0
		), Texture.screen
	);
}
