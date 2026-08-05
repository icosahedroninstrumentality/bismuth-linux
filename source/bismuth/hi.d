module bismuth.hi;

import bismuth.framework;
import bismuth.effect;

void drawHi (Vector2 position, Degree alpha) {
	Radian size = 500;
	drawGlassStroke(
		GlassStroke(
			([
				CubicBezier(Vector2(position.x - size * Radian(0.2),  position.y + size * Radian(0.000)),
				            Vector2(position.x + size * Radian(0.2),  position.y + size * Radian(0.200)),
				            Vector2(position.x + size * Radian(0.7),  position.y + size * Radian(0.900)),
				            Vector2(position.x + size * Radian(0.4),  position.y + size * Radian(0.900)),),
				CubicBezier(Vector2(position.x + size * Radian(0.4),  position.y + size * Radian(0.900)),
				            Vector2(position.x + size * Radian(0.2),  position.y + size * Radian(0.900)),
				            Vector2(position.x + size * Radian(0.2),  position.y + size * Radian(0.000)),
				            Vector2(position.x + size * Radian(0.2),  position.y + size * Radian(0.000)),),
				CubicBezier(Vector2(position.x + size * Radian(0.2),  position.y + size * Radian(0.000)),
				            Vector2(position.x + size * Radian(0.3),  position.y + size * Radian(0.400)),
				            Vector2(position.x + size * Radian(0.5),  position.y + size * Radian(0.400)),
				            Vector2(position.x + size * Radian(0.5),  position.y + size * Radian(0.200)),),
				CubicBezier(Vector2(position.x + size * Radian(0.5),  position.y + size * Radian(0.200)),
				            Vector2(position.x + size * Radian(0.5),  position.y + size * Radian(0.100)),
				            Vector2(position.x + size * Radian(0.5),  position.y + size * Radian(0.000)),
				            Vector2(position.x + size * Radian(0.6),  position.y + size * Radian(0.000)),),
				CubicBezier(Vector2(position.x + size * Radian(0.6),  position.y + size * Radian(0.000)),
				            Vector2(position.x + size * Radian(0.7),  position.y + size * Radian(0.000)),
				            Vector2(position.x + size * Radian(0.8),  position.y + size * Radian(0.400)),
				            Vector2(position.x + size * Radian(0.8),  position.y + size * Radian(0.400)),),
				CubicBezier(Vector2(position.x + size * Radian(0.8),  position.y + size * Radian(0.400)),
				            Vector2(position.x + size * Radian(0.8),  position.y + size * Radian(0.200)),
				            Vector2(position.x + size * Radian(0.8),  position.y + size * Radian(0.000)),
				            Vector2(position.x + size * Radian(0.9),  position.y + size * Radian(0.000)),),
				CubicBezier(Vector2(position.x + size * Radian(0.9),  position.y + size * Radian(0.000)),
				            Vector2(position.x + size * Radian(1.0),  position.y + size * Radian(0.000)),
				            Vector2(position.x + size * Radian(1.1),  position.y + size * Radian(0.200)),
				            Vector2(position.x + size * Radian(1.2),  position.y + size * Radian(0.400)),),
				CubicBezier(Vector2(position.x + size * Radian(0.85), position.y + size * Radian(0.675)),
				            Vector2(position.x + size * Radian(0.85), position.y + size * Radian(0.675)),
				            Vector2(position.x + size * Radian(0.85), position.y + size * Radian(0.675)),
				            Vector2(position.x + size * Radian(0.85), position.y + size * Radian(0.675)),),
			]),
			Radian(30),
			alpha,
			Radian(8),
			Vector4(Radian(0.51), Radian(0.52), Radian(0.53), Radian(1.0)),
			Vector4(Radian(0.27), Radian(0.28), Radian(0.29), Radian(1.0)),
			Vector4(Radian(0.5), Radian(0.5), Radian(0.5), Radian(1.0)),
			Vector4.one,
			Radian(4)
		), Texture.screen
	);
}
