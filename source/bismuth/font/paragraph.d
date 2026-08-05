module bismuth.font.paragraph;

import bismuth.framework;

void buildFont () {
	Font.paragraph = new Font();
	Font.paragraph.name = "Paragraph";
	Font.paragraph.author = "https://github.com/icosahedroninstrumentality";
	Font.paragraph.created = 1784435893000;
	Font.paragraph.symbols ~= FontSymbol("",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.10), Radian(-0.75)),
					Vector2(Radian(0.10), Radian(-0.75)),
					Vector2(Radian(0.10), Radian(-0.75)),
					Vector2(Radian(0.10), Radian(0.75)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(1.00), Radian(-0.75)),
					Vector2(Radian(1.00), Radian(-0.75)),
					Vector2(Radian(1.00), Radian(-0.75)),
					Vector2(Radian(1.00), Radian(0.75)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.10), Radian(0.75)),
					Vector2(Radian(0.10), Radian(0.75)),
					Vector2(Radian(0.10), Radian(0.75)),
					Vector2(Radian(1.00), Radian(0.75)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.10), Radian(-0.75)),
					Vector2(Radian(0.10), Radian(-0.75)),
					Vector2(Radian(0.10), Radian(-0.75)),
					Vector2(Radian(1.00), Radian(-0.75)),
				), Radian(0.06)
			),
		]),
		Radian(0.0), Radian(0.0), Radian(1.1),
	);
	Font.paragraph.symbols ~= FontSymbol(" ", ([]), Radian(0.0), Radian(0.0), Radian(0.3));
	Font.paragraph.symbols ~= FontSymbol("A",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(-0.25)),
					Vector2(Radian(0.100), Radian(-0.25)),
					Vector2(Radian(0.100), Radian(-0.25)),
					Vector2(Radian(0.350), Radian(0.50)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.350), Radian(0.50)),
					Vector2(Radian(0.350), Radian(0.50)),
					Vector2(Radian(0.350), Radian(0.50)),
					Vector2(Radian(0.600), Radian(-0.25)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.183), Radian(0.00)),
					Vector2(Radian(0.183), Radian(0.00)),
					Vector2(Radian(0.183), Radian(0.00)),
					Vector2(Radian(0.516), Radian(0.00)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.7),
	);
	Font.paragraph.symbols ~= FontSymbol("B",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.350), Radian(0.500)),
					Vector2(Radian(0.500), Radian(0.500)),
					Vector2(Radian(0.600), Radian(0.500)),
					Vector2(Radian(0.600), Radian(0.300)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.600), Radian(0.300)),
					Vector2(Radian(0.600), Radian(0.125)),
					Vector2(Radian(0.500), Radian(0.125)),
					Vector2(Radian(0.350), Radian(0.125)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.350), Radian(0.125)),
					Vector2(Radian(0.500), Radian(0.125)),
					Vector2(Radian(0.600), Radian(0.125)),
					Vector2(Radian(0.600), Radian(-0.050)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.600), Radian(-0.050)),
					Vector2(Radian(0.600), Radian(-0.250)),
					Vector2(Radian(0.500), Radian(-0.250)),
					Vector2(Radian(0.350), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.350), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.350), Radian(0.125)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.350), Radian(0.500)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.7),
	);
	Font.paragraph.symbols ~= FontSymbol("C",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.100), Radian(0.275)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.350), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.350), Radian(0.500)),
					Vector2(Radian(0.600), Radian(0.500)),
					Vector2(Radian(0.600), Radian(0.3125)),
					Vector2(Radian(0.600), Radian(0.3125)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.100), Radian(-0.025)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.350), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.350), Radian(-0.250)),
					Vector2(Radian(0.600), Radian(-0.250)),
					Vector2(Radian(0.600), Radian(-0.0625)),
					Vector2(Radian(0.600), Radian(-0.0625)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.7),
	);
	Font.paragraph.symbols ~= FontSymbol("D",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.350), Radian(0.500)),
					Vector2(Radian(0.600), Radian(0.500)),
					Vector2(Radian(0.600), Radian(0.300)),
					Vector2(Radian(0.600), Radian(0.125)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.350), Radian(-0.250)),
					Vector2(Radian(0.600), Radian(-0.250)),
					Vector2(Radian(0.600), Radian(-0.075)),
					Vector2(Radian(0.600), Radian(0.125)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.350), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.350), Radian(0.500)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.7),
	);
	Font.paragraph.symbols ~= FontSymbol("E",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.600), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.600), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.400), Radian(0.125)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.7),
	);
	Font.paragraph.symbols ~= FontSymbol("F",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.600), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.400), Radian(0.125)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.7),
	);
	Font.paragraph.symbols ~= FontSymbol("G",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.350), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.350), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.350), Radian(0.500)),
					Vector2(Radian(0.600), Radian(0.500)),
					Vector2(Radian(0.600), Radian(0.3125)),
					Vector2(Radian(0.600), Radian(0.3125)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.350), Radian(-0.250)),
					Vector2(Radian(0.350), Radian(-0.250)),
					Vector2(Radian(0.600), Radian(-0.250)),
					Vector2(Radian(0.600), Radian(-0.125)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.600), Radian(-0.125)),
					Vector2(Radian(0.600), Radian(-0.125)),
					Vector2(Radian(0.600), Radian(-0.125)),
					Vector2(Radian(0.600), Radian(0.125)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.600), Radian(0.125)),
					Vector2(Radian(0.600), Radian(0.125)),
					Vector2(Radian(0.600), Radian(0.125)),
					Vector2(Radian(0.400), Radian(0.125)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.7),
	);
	Font.paragraph.symbols ~= FontSymbol("H",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.600), Radian(-0.250)),
					Vector2(Radian(0.600), Radian(-0.250)),
					Vector2(Radian(0.600), Radian(-0.250)),
					Vector2(Radian(0.600), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.600), Radian(0.125)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.7),
	);
	Font.paragraph.symbols ~= FontSymbol("I",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(0.500)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.2),
	);
	Font.paragraph.symbols ~= FontSymbol("J",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.400), Radian(0.000)),
					Vector2(Radian(0.400), Radian(0.000)),
					Vector2(Radian(0.400), Radian(0.000)),
					Vector2(Radian(0.400), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.400), Radian(0.000)),
					Vector2(Radian(0.400), Radian(-0.250)),
					Vector2(Radian(0.300), Radian(-0.250)),
					Vector2(Radian(0.200), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(-0.125)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.300), Radian(-0.250)),
					Vector2(Radian(0.200), Radian(-0.250)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.5),
	);
	Font.paragraph.symbols ~= FontSymbol("K",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.600), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.225), Radian(0.125)),
					Vector2(Radian(0.225), Radian(0.125)),
					Vector2(Radian(0.225), Radian(0.125)),
					Vector2(Radian(0.600), Radian(-0.250)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.7),
	);
	Font.paragraph.symbols ~= FontSymbol("L",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.600), Radian(-0.250)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.7),
	);
	Font.paragraph.symbols ~= FontSymbol("M",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.600), Radian(-0.250)),
					Vector2(Radian(0.600), Radian(-0.250)),
					Vector2(Radian(0.600), Radian(-0.250)),
					Vector2(Radian(0.600), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.350), Radian(0.125)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.600), Radian(0.500)),
					Vector2(Radian(0.600), Radian(0.500)),
					Vector2(Radian(0.600), Radian(0.500)),
					Vector2(Radian(0.350), Radian(0.125)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.7),
	);
	Font.paragraph.symbols ~= FontSymbol("N",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.600), Radian(-0.250)),
					Vector2(Radian(0.600), Radian(-0.250)),
					Vector2(Radian(0.600), Radian(-0.250)),
					Vector2(Radian(0.600), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.600), Radian(-0.250)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.7),
	);
	Font.paragraph.symbols ~= FontSymbol("O",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.350), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.600), Radian(0.125)),
					Vector2(Radian(0.600), Radian(0.250)),
					Vector2(Radian(0.600), Radian(0.500)),
					Vector2(Radian(0.350), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.350), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.600), Radian(0.125)),
					Vector2(Radian(0.600), Radian(0.000)),
					Vector2(Radian(0.600), Radian(-0.250)),
					Vector2(Radian(0.350), Radian(-0.250)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.7),
	);
	Font.paragraph.symbols ~= FontSymbol("P",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.350), Radian(0.500)),
					Vector2(Radian(0.500), Radian(0.500)),
					Vector2(Radian(0.600), Radian(0.500)),
					Vector2(Radian(0.600), Radian(0.300)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.600), Radian(0.300)),
					Vector2(Radian(0.600), Radian(0.125)),
					Vector2(Radian(0.500), Radian(0.125)),
					Vector2(Radian(0.350), Radian(0.125)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.350), Radian(0.125)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.350), Radian(0.500)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.7),
	);
	Font.paragraph.symbols ~= FontSymbol("Q",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.350), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.600), Radian(0.125)),
					Vector2(Radian(0.600), Radian(0.250)),
					Vector2(Radian(0.600), Radian(0.500)),
					Vector2(Radian(0.350), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.350), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.600), Radian(0.125)),
					Vector2(Radian(0.600), Radian(0.000)),
					Vector2(Radian(0.600), Radian(-0.250)),
					Vector2(Radian(0.350), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.350), Radian(0.000)),
					Vector2(Radian(0.350), Radian(0.000)),
					Vector2(Radian(0.350), Radian(0.000)),
					Vector2(Radian(0.600), Radian(-0.250)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.7),
	);
	Font.paragraph.symbols ~= FontSymbol("R",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.350), Radian(0.500)),
					Vector2(Radian(0.500), Radian(0.500)),
					Vector2(Radian(0.600), Radian(0.500)),
					Vector2(Radian(0.600), Radian(0.300)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.600), Radian(0.300)),
					Vector2(Radian(0.600), Radian(0.125)),
					Vector2(Radian(0.500), Radian(0.125)),
					Vector2(Radian(0.350), Radian(0.125)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.350), Radian(0.125)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.350), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.350), Radian(0.125)),
					Vector2(Radian(0.350), Radian(0.125)),
					Vector2(Radian(0.600), Radian(0.125)),
					Vector2(Radian(0.600), Radian(-0.250)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.7),
	);
	Font.paragraph.symbols ~= FontSymbol("S",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.350), Radian(0.125)),
					Vector2(Radian(0.200), Radian(0.125)),
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.100), Radian(0.3125)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.350), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.3125)),
					Vector2(Radian(0.100), Radian(0.3125)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.350), Radian(0.500)),
					Vector2(Radian(0.600), Radian(0.500)),
					Vector2(Radian(0.600), Radian(0.3125)),
					Vector2(Radian(0.600), Radian(0.3125)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.350), Radian(0.125)),
					Vector2(Radian(0.500), Radian(0.125)),
					Vector2(Radian(0.600), Radian(0.125)),
					Vector2(Radian(0.600), Radian(-0.0625)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.350), Radian(-0.25)),
					Vector2(Radian(0.600), Radian(-0.25)),
					Vector2(Radian(0.600), Radian(-0.0625)),
					Vector2(Radian(0.600), Radian(-0.0625)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.350), Radian(-0.25)),
					Vector2(Radian(0.100), Radian(-0.25)),
					Vector2(Radian(0.100), Radian(-0.0625)),
					Vector2(Radian(0.100), Radian(-0.0625)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.7),
	);
	Font.paragraph.symbols ~= FontSymbol("T",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.600), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.350), Radian(0.500)),
					Vector2(Radian(0.350), Radian(0.500)),
					Vector2(Radian(0.350), Radian(0.500)),
					Vector2(Radian(0.350), Radian(-0.250)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.7),
	);
	Font.paragraph.symbols ~= FontSymbol("U",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(-0.050)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.600), Radian(0.500)),
					Vector2(Radian(0.600), Radian(0.500)),
					Vector2(Radian(0.600), Radian(0.500)),
					Vector2(Radian(0.600), Radian(-0.050)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.350), Radian(-0.250)),
					Vector2(Radian(0.350), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.050)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.350), Radian(-0.250)),
					Vector2(Radian(0.350), Radian(-0.250)),
					Vector2(Radian(0.600), Radian(-0.250)),
					Vector2(Radian(0.600), Radian(-0.050)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.7),
	);
	Font.paragraph.symbols ~= FontSymbol("V",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.350), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.600), Radian(0.500)),
					Vector2(Radian(0.600), Radian(0.500)),
					Vector2(Radian(0.600), Radian(0.500)),
					Vector2(Radian(0.350), Radian(-0.250)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.7),
	);
	Font.paragraph.symbols ~= FontSymbol("W",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.300), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.500)),
					Vector2(Radian(0.500), Radian(0.500)),
					Vector2(Radian(0.500), Radian(0.500)),
					Vector2(Radian(0.300), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.500)),
					Vector2(Radian(0.500), Radian(0.500)),
					Vector2(Radian(0.500), Radian(0.500)),
					Vector2(Radian(0.700), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.900), Radian(0.500)),
					Vector2(Radian(0.900), Radian(0.500)),
					Vector2(Radian(0.900), Radian(0.500)),
					Vector2(Radian(0.700), Radian(-0.250)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(1.0),
	);
	Font.paragraph.symbols ~= FontSymbol("X",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.600), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.600), Radian(0.500)),
					Vector2(Radian(0.600), Radian(0.500)),
					Vector2(Radian(0.600), Radian(0.500)),
					Vector2(Radian(0.100), Radian(-0.250)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.7),
	);
	Font.paragraph.symbols ~= FontSymbol("Y",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.350), Radian(0.125)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.600), Radian(0.500)),
					Vector2(Radian(0.600), Radian(0.500)),
					Vector2(Radian(0.600), Radian(0.500)),
					Vector2(Radian(0.350), Radian(0.125)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.350), Radian(0.125)),
					Vector2(Radian(0.350), Radian(-0.250)),
					Vector2(Radian(0.350), Radian(-0.250)),
					Vector2(Radian(0.350), Radian(-0.250)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.7),
	);
	Font.paragraph.symbols ~= FontSymbol("Z",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.600), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.600), Radian(0.500)),
					Vector2(Radian(0.600), Radian(0.500)),
					Vector2(Radian(0.600), Radian(0.500)),
					Vector2(Radian(0.100), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.600), Radian(-0.250)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.7),
	);
	Font.paragraph.symbols ~= FontSymbol("a",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.300), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.100), Radian(0.125)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.000)),
					Vector2(Radian(0.500), Radian(0.100)),
					Vector2(Radian(0.500), Radian(0.250)),
					Vector2(Radian(0.300), Radian(0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.000)),
					Vector2(Radian(0.500), Radian(0.000)),
					Vector2(Radian(0.500), Radian(0.000)),
					Vector2(Radian(0.500), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.000)),
					Vector2(Radian(0.300), Radian(0.000)),
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(-0.125)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(-0.125)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.200), Radian(-0.250)),
					Vector2(Radian(0.300), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(-0.125)),
					Vector2(Radian(0.500), Radian(-0.125)),
					Vector2(Radian(0.500), Radian(-0.250)),
					Vector2(Radian(0.300), Radian(-0.250)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.6),
	);
	Font.paragraph.symbols ~= FontSymbol("b",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(0.100)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.300), Radian(0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.000)),
					Vector2(Radian(0.500), Radian(0.100)),
					Vector2(Radian(0.500), Radian(0.250)),
					Vector2(Radian(0.300), Radian(0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(-0.100)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.300), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.000)),
					Vector2(Radian(0.500), Radian(-0.100)),
					Vector2(Radian(0.500), Radian(-0.250)),
					Vector2(Radian(0.300), Radian(-0.250)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.6),
	);
	Font.paragraph.symbols ~= FontSymbol("c",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(0.100)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.300), Radian(0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.300), Radian(0.250)),
					Vector2(Radian(0.300), Radian(0.250)),
					Vector2(Radian(0.500), Radian(0.250)),
					Vector2(Radian(0.500), Radian(0.125)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(-0.100)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.300), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.300), Radian(-0.250)),
					Vector2(Radian(0.300), Radian(-0.250)),
					Vector2(Radian(0.500), Radian(-0.250)),
					Vector2(Radian(0.500), Radian(-0.125)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.6),
	);
	Font.paragraph.symbols ~= FontSymbol("d",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.500)),
					Vector2(Radian(0.500), Radian(0.500)),
					Vector2(Radian(0.500), Radian(0.500)),
					Vector2(Radian(0.500), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(0.100)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.300), Radian(0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.000)),
					Vector2(Radian(0.500), Radian(0.100)),
					Vector2(Radian(0.500), Radian(0.250)),
					Vector2(Radian(0.300), Radian(0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(-0.100)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.300), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.000)),
					Vector2(Radian(0.500), Radian(-0.100)),
					Vector2(Radian(0.500), Radian(-0.250)),
					Vector2(Radian(0.300), Radian(-0.250)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.6),
	);
	Font.paragraph.symbols ~= FontSymbol("e",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(0.100)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.300), Radian(0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.000)),
					Vector2(Radian(0.500), Radian(0.100)),
					Vector2(Radian(0.500), Radian(0.250)),
					Vector2(Radian(0.300), Radian(0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(-0.100)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.300), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.300), Radian(-0.250)),
					Vector2(Radian(0.300), Radian(-0.250)),
					Vector2(Radian(0.500), Radian(-0.250)),
					Vector2(Radian(0.500), Radian(-0.200)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.500), Radian(0.000)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.6),
	);
	Font.paragraph.symbols ~= FontSymbol("f",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.200), Radian(-0.250)),
					Vector2(Radian(0.200), Radian(0.250)),
					Vector2(Radian(0.200), Radian(0.250)),
					Vector2(Radian(0.200), Radian(0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.200), Radian(0.250)),
					Vector2(Radian(0.200), Radian(0.375)),
					Vector2(Radian(0.200), Radian(0.500)),
					Vector2(Radian(0.300), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.300), Radian(0.250)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.4),
	);
	Font.paragraph.symbols ~= FontSymbol("g",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.250)),
					Vector2(Radian(0.500), Radian(0.250)),
					Vector2(Radian(0.500), Radian(0.250)),
					Vector2(Radian(0.500), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(-0.250)),
					Vector2(Radian(0.500), Radian(-0.375)),
					Vector2(Radian(0.500), Radian(-0.500)),
					Vector2(Radian(0.300), Radian(-0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.300), Radian(-0.500)),
					Vector2(Radian(0.300), Radian(-0.500)),
					Vector2(Radian(0.100), Radian(-0.500)),
					Vector2(Radian(0.100), Radian(-0.375)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(0.100)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.300), Radian(0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.000)),
					Vector2(Radian(0.500), Radian(0.100)),
					Vector2(Radian(0.500), Radian(0.250)),
					Vector2(Radian(0.300), Radian(0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(-0.100)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.300), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.000)),
					Vector2(Radian(0.500), Radian(-0.100)),
					Vector2(Radian(0.500), Radian(-0.250)),
					Vector2(Radian(0.300), Radian(-0.250)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.6),
	);
	Font.paragraph.symbols ~= FontSymbol("h",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(0.100)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.300), Radian(0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.000)),
					Vector2(Radian(0.500), Radian(0.100)),
					Vector2(Radian(0.500), Radian(0.250)),
					Vector2(Radian(0.300), Radian(0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.000)),
					Vector2(Radian(0.500), Radian(0.000)),
					Vector2(Radian(0.500), Radian(0.000)),
					Vector2(Radian(0.500), Radian(-0.250)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.6),
	);
	Font.paragraph.symbols ~= FontSymbol("i",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.2),
	);
	Font.paragraph.symbols ~= FontSymbol("j",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.375)),
					Vector2(Radian(0.100), Radian(-0.500)),
					Vector2(Radian(0.000), Radian(-0.500)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.2),
	);
	Font.paragraph.symbols ~= FontSymbol("k",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(-0.150)),
					Vector2(Radian(0.100), Radian(-0.150)),
					Vector2(Radian(0.100), Radian(-0.150)),
					Vector2(Radian(0.500), Radian(0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.250), Radian(0.000)),
					Vector2(Radian(0.250), Radian(0.000)),
					Vector2(Radian(0.250), Radian(0.000)),
					Vector2(Radian(0.500), Radian(-0.250)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.6),
	);
	Font.paragraph.symbols ~= FontSymbol("l",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.000)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(-0.125)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.200), Radian(-0.250)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.3),
	);
	Font.paragraph.symbols ~= FontSymbol("m",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(0.100)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.300), Radian(0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.000)),
					Vector2(Radian(0.500), Radian(0.100)),
					Vector2(Radian(0.500), Radian(0.250)),
					Vector2(Radian(0.300), Radian(0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.000)),
					Vector2(Radian(0.500), Radian(0.000)),
					Vector2(Radian(0.500), Radian(0.000)),
					Vector2(Radian(0.500), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.000)),
					Vector2(Radian(0.500), Radian(0.100)),
					Vector2(Radian(0.500), Radian(0.250)),
					Vector2(Radian(0.700), Radian(0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.900), Radian(0.000)),
					Vector2(Radian(0.900), Radian(0.100)),
					Vector2(Radian(0.900), Radian(0.250)),
					Vector2(Radian(0.700), Radian(0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.000)),
					Vector2(Radian(0.500), Radian(0.000)),
					Vector2(Radian(0.500), Radian(0.000)),
					Vector2(Radian(0.500), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.900), Radian(0.000)),
					Vector2(Radian(0.900), Radian(0.000)),
					Vector2(Radian(0.900), Radian(0.000)),
					Vector2(Radian(0.900), Radian(-0.250)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(1.0),
	);
	Font.paragraph.symbols ~= FontSymbol("n",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(0.100)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.300), Radian(0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.000)),
					Vector2(Radian(0.500), Radian(0.100)),
					Vector2(Radian(0.500), Radian(0.250)),
					Vector2(Radian(0.300), Radian(0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.000)),
					Vector2(Radian(0.500), Radian(0.000)),
					Vector2(Radian(0.500), Radian(0.000)),
					Vector2(Radian(0.500), Radian(-0.250)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.6),
	);
	Font.paragraph.symbols ~= FontSymbol("o",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(0.100)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.300), Radian(0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.000)),
					Vector2(Radian(0.500), Radian(0.100)),
					Vector2(Radian(0.500), Radian(0.250)),
					Vector2(Radian(0.300), Radian(0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(-0.100)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.300), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.000)),
					Vector2(Radian(0.500), Radian(-0.100)),
					Vector2(Radian(0.500), Radian(-0.250)),
					Vector2(Radian(0.300), Radian(-0.250)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.6),
	);
	Font.paragraph.symbols ~= FontSymbol("p",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(-0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(0.100)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.300), Radian(0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.000)),
					Vector2(Radian(0.500), Radian(0.100)),
					Vector2(Radian(0.500), Radian(0.250)),
					Vector2(Radian(0.300), Radian(0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(-0.100)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.300), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.000)),
					Vector2(Radian(0.500), Radian(-0.100)),
					Vector2(Radian(0.500), Radian(-0.250)),
					Vector2(Radian(0.300), Radian(-0.250)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.6),
	);
	Font.paragraph.symbols ~= FontSymbol("q",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.250)),
					Vector2(Radian(0.500), Radian(0.250)),
					Vector2(Radian(0.500), Radian(0.250)),
					Vector2(Radian(0.500), Radian(-0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(0.100)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.300), Radian(0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.000)),
					Vector2(Radian(0.500), Radian(0.100)),
					Vector2(Radian(0.500), Radian(0.250)),
					Vector2(Radian(0.300), Radian(0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(-0.100)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.300), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.000)),
					Vector2(Radian(0.500), Radian(-0.100)),
					Vector2(Radian(0.500), Radian(-0.250)),
					Vector2(Radian(0.300), Radian(-0.250)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.6),
	);
	Font.paragraph.symbols ~= FontSymbol("r",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.300), Radian(0.250)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.4),
	);
	Font.paragraph.symbols ~= FontSymbol("s",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.300), Radian(0.000)),
					Vector2(Radian(0.200), Radian(0.000)),
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(0.125)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.300), Radian(0.250)),
					Vector2(Radian(0.300), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.125)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.300), Radian(0.250)),
					Vector2(Radian(0.300), Radian(0.250)),
					Vector2(Radian(0.500), Radian(0.250)),
					Vector2(Radian(0.500), Radian(0.125)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.300), Radian(0.000)),
					Vector2(Radian(0.400), Radian(0.000)),
					Vector2(Radian(0.500), Radian(0.000)),
					Vector2(Radian(0.500), Radian(-0.125)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.300), Radian(-0.250)),
					Vector2(Radian(0.300), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.125)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.300), Radian(-0.250)),
					Vector2(Radian(0.300), Radian(-0.250)),
					Vector2(Radian(0.500), Radian(-0.250)),
					Vector2(Radian(0.500), Radian(-0.125)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.6),
	);
	Font.paragraph.symbols ~= FontSymbol("t",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.200), Radian(0.500)),
					Vector2(Radian(0.200), Radian(0.500)),
					Vector2(Radian(0.200), Radian(0.500)),
					Vector2(Radian(0.200), Radian(0.000)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.200), Radian(0.000)),
					Vector2(Radian(0.200), Radian(-0.125)),
					Vector2(Radian(0.200), Radian(-0.250)),
					Vector2(Radian(0.300), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.300), Radian(0.250)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.4),
	);
	Font.paragraph.symbols ~= FontSymbol("u",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(-0.250)),
					Vector2(Radian(0.500), Radian(-0.250)),
					Vector2(Radian(0.500), Radian(-0.250)),
					Vector2(Radian(0.500), Radian(0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(-0.100)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.300), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.000)),
					Vector2(Radian(0.500), Radian(-0.100)),
					Vector2(Radian(0.500), Radian(-0.250)),
					Vector2(Radian(0.300), Radian(-0.250)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.6),
	);
	Font.paragraph.symbols ~= FontSymbol("v",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.300), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.250)),
					Vector2(Radian(0.500), Radian(0.250)),
					Vector2(Radian(0.500), Radian(0.250)),
					Vector2(Radian(0.300), Radian(-0.250)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.6),
	);
	Font.paragraph.symbols ~= FontSymbol("w",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.250), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.400), Radian(0.250)),
					Vector2(Radian(0.400), Radian(0.250)),
					Vector2(Radian(0.400), Radian(0.250)),
					Vector2(Radian(0.250), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.400), Radian(0.250)),
					Vector2(Radian(0.400), Radian(0.250)),
					Vector2(Radian(0.400), Radian(0.250)),
					Vector2(Radian(0.550), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.700), Radian(0.250)),
					Vector2(Radian(0.700), Radian(0.250)),
					Vector2(Radian(0.700), Radian(0.250)),
					Vector2(Radian(0.550), Radian(-0.250)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.8),
	);
	Font.paragraph.symbols ~= FontSymbol("x",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.500), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.250)),
					Vector2(Radian(0.500), Radian(0.250)),
					Vector2(Radian(0.500), Radian(0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.6),
	);
	Font.paragraph.symbols ~= FontSymbol("y",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.300), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.250)),
					Vector2(Radian(0.500), Radian(0.250)),
					Vector2(Radian(0.500), Radian(0.250)),
					Vector2(Radian(0.300), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.300), Radian(-0.250)),
					Vector2(Radian(0.200), Radian(-0.500)),
					Vector2(Radian(0.200), Radian(-0.500)),
					Vector2(Radian(0.100), Radian(-0.500)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.6),
	);
	Font.paragraph.symbols ~= FontSymbol("z",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.500), Radian(0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.250)),
					Vector2(Radian(0.500), Radian(0.250)),
					Vector2(Radian(0.500), Radian(0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.500), Radian(-0.250)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.6),
	);
	Font.paragraph.symbols ~= FontSymbol("0",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.300), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.125)),
					Vector2(Radian(0.500), Radian(0.250)),
					Vector2(Radian(0.500), Radian(0.500)),
					Vector2(Radian(0.300), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.300), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.125)),
					Vector2(Radian(0.500), Radian(0.000)),
					Vector2(Radian(0.500), Radian(-0.250)),
					Vector2(Radian(0.300), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.300), Radian(0.250)),
					Vector2(Radian(0.300), Radian(0.250)),
					Vector2(Radian(0.300), Radian(0.250)),
					Vector2(Radian(0.300), Radian(0.000)),
				), Radian(0.04)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.6),
	);
	Font.paragraph.symbols ~= FontSymbol("1",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.500), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.300), Radian(-0.250)),
					Vector2(Radian(0.300), Radian(-0.250)),
					Vector2(Radian(0.300), Radian(-0.250)),
					Vector2(Radian(0.300), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.300), Radian(0.500)),
					Vector2(Radian(0.300), Radian(0.500)),
					Vector2(Radian(0.300), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.300)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.6),
	);
	Font.paragraph.symbols ~= FontSymbol("2",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.500), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.375)),
					Vector2(Radian(0.150), Radian(0.500)),
					Vector2(Radian(0.250), Radian(0.500)),
					Vector2(Radian(0.300), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.375)),
					Vector2(Radian(0.500), Radian(0.500)),
					Vector2(Radian(0.350), Radian(0.500)),
					Vector2(Radian(0.300), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.375)),
					Vector2(Radian(0.500), Radian(0.125)),
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(-0.250)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.6),
	);
	Font.paragraph.symbols ~= FontSymbol("3",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.3125)),
					Vector2(Radian(0.100), Radian(0.3125)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.300), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.3125)),
					Vector2(Radian(0.500), Radian(0.3125)),
					Vector2(Radian(0.500), Radian(0.500)),
					Vector2(Radian(0.300), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.3125)),
					Vector2(Radian(0.500), Radian(0.3125)),
					Vector2(Radian(0.500), Radian(0.125)),
					Vector2(Radian(0.300), Radian(0.125)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(-0.0625)),
					Vector2(Radian(0.500), Radian(-0.0625)),
					Vector2(Radian(0.500), Radian(0.125)),
					Vector2(Radian(0.300), Radian(0.125)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(-0.0625)),
					Vector2(Radian(0.100), Radian(-0.0625)),
					Vector2(Radian(0.100), Radian(-0.25)),
					Vector2(Radian(0.300), Radian(-0.25)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(-0.0625)),
					Vector2(Radian(0.500), Radian(-0.0625)),
					Vector2(Radian(0.500), Radian(-0.25)),
					Vector2(Radian(0.300), Radian(-0.25)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.6),
	);
	Font.paragraph.symbols ~= FontSymbol("4",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.500), Radian(0.125)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.400), Radian(-0.250)),
					Vector2(Radian(0.400), Radian(-0.250)),
					Vector2(Radian(0.400), Radian(-0.250)),
					Vector2(Radian(0.400), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.400), Radian(0.500)),
					Vector2(Radian(0.400), Radian(0.500)),
					Vector2(Radian(0.400), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.125)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.6),
	);
	Font.paragraph.symbols ~= FontSymbol("5",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.500), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.125)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.000)),
					Vector2(Radian(0.500), Radian(0.100)),
					Vector2(Radian(0.500), Radian(0.250)),
					Vector2(Radian(0.300), Radian(0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.300), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.100), Radian(0.125)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.000)),
					Vector2(Radian(0.500), Radian(-0.100)),
					Vector2(Radian(0.500), Radian(-0.250)),
					Vector2(Radian(0.300), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.300), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.125)),
					Vector2(Radian(0.100), Radian(-0.125)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.6),
	);
	Font.paragraph.symbols ~= FontSymbol("6",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.300), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.3125)),
					Vector2(Radian(0.500), Radian(0.3125)),
					Vector2(Radian(0.500), Radian(0.500)),
					Vector2(Radian(0.300), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.300), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(-0.0625)),
					Vector2(Radian(0.500), Radian(-0.0625)),
					Vector2(Radian(0.500), Radian(-0.250)),
					Vector2(Radian(0.300), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(-0.0625)),
					Vector2(Radian(0.500), Radian(-0.0625)),
					Vector2(Radian(0.500), Radian(0.125)),
					Vector2(Radian(0.300), Radian(0.125)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.300), Radian(0.125)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.6),
	);
	Font.paragraph.symbols ~= FontSymbol("7",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.200), Radian(-0.250)),
					Vector2(Radian(0.200), Radian(-0.250)),
					Vector2(Radian(0.200), Radian(-0.250)),
					Vector2(Radian(0.500), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.500), Radian(0.500)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.6),
	);
	Font.paragraph.symbols ~= FontSymbol("8",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.3125)),
					Vector2(Radian(0.100), Radian(0.3125)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.300), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.3125)),
					Vector2(Radian(0.500), Radian(0.3125)),
					Vector2(Radian(0.500), Radian(0.500)),
					Vector2(Radian(0.300), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.3125)),
					Vector2(Radian(0.100), Radian(0.3125)),
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.300), Radian(0.125)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.3125)),
					Vector2(Radian(0.500), Radian(0.3125)),
					Vector2(Radian(0.500), Radian(0.125)),
					Vector2(Radian(0.300), Radian(0.125)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(-0.0625)),
					Vector2(Radian(0.100), Radian(-0.0625)),
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.300), Radian(0.125)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(-0.0625)),
					Vector2(Radian(0.500), Radian(-0.0625)),
					Vector2(Radian(0.500), Radian(0.125)),
					Vector2(Radian(0.300), Radian(0.125)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(-0.0625)),
					Vector2(Radian(0.100), Radian(-0.0625)),
					Vector2(Radian(0.100), Radian(-0.25)),
					Vector2(Radian(0.300), Radian(-0.25)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(-0.0625)),
					Vector2(Radian(0.500), Radian(-0.0625)),
					Vector2(Radian(0.500), Radian(-0.25)),
					Vector2(Radian(0.300), Radian(-0.25)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.6),
	);
	Font.paragraph.symbols ~= FontSymbol("9",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.6-0.100), Radian(0.25-0.125)),
					Vector2(Radian(0.6-0.100), Radian(0.25-0.250)),
					Vector2(Radian(0.6-0.100), Radian(0.25-0.500)),
					Vector2(Radian(0.6-0.300), Radian(0.25-0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.6-0.500), Radian(0.25-0.3125)),
					Vector2(Radian(0.6-0.500), Radian(0.25-0.3125)),
					Vector2(Radian(0.6-0.500), Radian(0.25-0.500)),
					Vector2(Radian(0.6-0.300), Radian(0.25-0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.6-0.100), Radian(0.25- 0.125)),
					Vector2(Radian(0.6-0.100), Radian(0.25- 0.000)),
					Vector2(Radian(0.6-0.100), Radian(0.25- -0.250)),
					Vector2(Radian(0.6-0.300), Radian(0.25- -0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.6-0.500), Radian(0.25- -0.0625)),
					Vector2(Radian(0.6-0.500), Radian(0.25- -0.0625)),
					Vector2(Radian(0.6-0.500), Radian(0.25- -0.250)),
					Vector2(Radian(0.6-0.300), Radian(0.25- -0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.6-0.500), Radian(0.25- -0.0625)),
					Vector2(Radian(0.6-0.500), Radian(0.25- -0.0625)),
					Vector2(Radian(0.6-0.500), Radian(0.25-  0.125)),
					Vector2(Radian(0.6-0.300), Radian(0.25-  0.125)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.6-0.100), Radian(0.25- 0.125)),
					Vector2(Radian(0.6-0.100), Radian(0.25- 0.125)),
					Vector2(Radian(0.6-0.100), Radian(0.25- 0.125)),
					Vector2(Radian(0.6-0.300), Radian(0.25- 0.125)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.6),
	);
	Font.paragraph.symbols ~= FontSymbol(".",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.2),
	);
	Font.paragraph.symbols ~= FontSymbol(":",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.250)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.2),
	);
	Font.paragraph.symbols ~= FontSymbol(",",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.070), Radian(-0.400)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.2),
	);
	Font.paragraph.symbols ~= FontSymbol(";",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.250)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.070), Radian(-0.400)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.2),
	);
	Font.paragraph.symbols ~= FontSymbol("!",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(-0.100)),
					Vector2(Radian(0.100), Radian(-0.100)),
					Vector2(Radian(0.100), Radian(-0.100)),
					Vector2(Radian(0.100), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.2),
	);
	Font.paragraph.symbols ~= FontSymbol("?",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.300)),
					Vector2(Radian(0.100), Radian(0.300)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.300), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.300)),
					Vector2(Radian(0.500), Radian(0.300)),
					Vector2(Radian(0.500), Radian(0.500)),
					Vector2(Radian(0.300), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.500), Radian(0.300)),
					Vector2(Radian(0.500), Radian(0.100)),
					Vector2(Radian(0.300), Radian(0.100)),
					Vector2(Radian(0.300), Radian(-0.100)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.300), Radian(-0.250)),
					Vector2(Radian(0.300), Radian(-0.250)),
					Vector2(Radian(0.300), Radian(-0.250)),
					Vector2(Radian(0.300), Radian(-0.250)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.6),
	);
	Font.paragraph.symbols ~= FontSymbol("_",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(-0.500)),
					Vector2(Radian(0.100), Radian(-0.500)),
					Vector2(Radian(0.100), Radian(-0.500)),
					Vector2(Radian(0.600), Radian(-0.500)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.7),
	);
	Font.paragraph.symbols ~= FontSymbol("-",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.500), Radian(0.125)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.6),
	);
	Font.paragraph.symbols ~= FontSymbol("+",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.500), Radian(0.125)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.300), Radian(0.325)),
					Vector2(Radian(0.300), Radian(0.325)),
					Vector2(Radian(0.300), Radian(0.325)),
					Vector2(Radian(0.300), Radian(-0.125)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.6),
	);
	Font.paragraph.symbols ~= FontSymbol("/",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.300), Radian(0.500)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.4),
	);
	Font.paragraph.symbols ~= FontSymbol("\\",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.300), Radian(-0.250)),
					Vector2(Radian(0.300), Radian(-0.250)),
					Vector2(Radian(0.300), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(0.500)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.4),
	);
	Font.paragraph.symbols ~= FontSymbol("|",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(0.500)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.2),
	);
	Font.paragraph.symbols ~= FontSymbol("=",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.225)),
					Vector2(Radian(0.100), Radian(0.225)),
					Vector2(Radian(0.100), Radian(0.225)),
					Vector2(Radian(0.500), Radian(0.225)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(-0.025)),
					Vector2(Radian(0.100), Radian(-0.025)),
					Vector2(Radian(0.100), Radian(-0.025)),
					Vector2(Radian(0.500), Radian(-0.025)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.6),
	);
	Font.paragraph.symbols ~= FontSymbol("(",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(0.250)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.300), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(-0.250)),
					Vector2(Radian(0.100), Radian(-0.500)),
					Vector2(Radian(0.300), Radian(-0.500)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.4),
	);
	Font.paragraph.symbols ~= FontSymbol(")",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.300), Radian(0.000)),
					Vector2(Radian(0.300), Radian(0.250)),
					Vector2(Radian(0.300), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.300), Radian(0.000)),
					Vector2(Radian(0.300), Radian(-0.250)),
					Vector2(Radian(0.300), Radian(-0.500)),
					Vector2(Radian(0.100), Radian(-0.500)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.4),
	);
	Font.paragraph.symbols ~= FontSymbol("[",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(-0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.300), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(-0.500)),
					Vector2(Radian(0.100), Radian(-0.500)),
					Vector2(Radian(0.100), Radian(-0.500)),
					Vector2(Radian(0.300), Radian(-0.500)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.4),
	);
	Font.paragraph.symbols ~= FontSymbol("]",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.300), Radian(0.500)),
					Vector2(Radian(0.300), Radian(0.500)),
					Vector2(Radian(0.300), Radian(0.500)),
					Vector2(Radian(0.300), Radian(-0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.300), Radian(0.500)),
					Vector2(Radian(0.300), Radian(0.500)),
					Vector2(Radian(0.300), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.300), Radian(-0.500)),
					Vector2(Radian(0.300), Radian(-0.500)),
					Vector2(Radian(0.300), Radian(-0.500)),
					Vector2(Radian(0.100), Radian(-0.500)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.4),
	);
	Font.paragraph.symbols ~= FontSymbol("{",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.300), Radian(0.000)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.300), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.300), Radian(0.000)),
					Vector2(Radian(0.100), Radian(-0.500)),
					Vector2(Radian(0.300), Radian(-0.500)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.4),
	);
	Font.paragraph.symbols ~= FontSymbol("}",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.300), Radian(0.000)),
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.300), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.300), Radian(0.000)),
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.300), Radian(-0.500)),
					Vector2(Radian(0.100), Radian(-0.500)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.4),
	);
	Font.paragraph.symbols ~= FontSymbol("<",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.400), Radian(0.300)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.100), Radian(0.000)),
					Vector2(Radian(0.400), Radian(-0.300)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.5),
	);
	Font.paragraph.symbols ~= FontSymbol(">",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.400), Radian(0.000)),
					Vector2(Radian(0.400), Radian(0.000)),
					Vector2(Radian(0.400), Radian(0.000)),
					Vector2(Radian(0.100), Radian(0.300)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.400), Radian(0.000)),
					Vector2(Radian(0.400), Radian(0.000)),
					Vector2(Radian(0.400), Radian(0.000)),
					Vector2(Radian(0.100), Radian(-0.300)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.5),
	);
	Font.paragraph.symbols ~= FontSymbol("\"",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.300)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.300), Radian(0.500)),
					Vector2(Radian(0.300), Radian(0.500)),
					Vector2(Radian(0.300), Radian(0.500)),
					Vector2(Radian(0.300), Radian(0.300)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.4),
	);
	Font.paragraph.symbols ~= FontSymbol("'",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.500)),
					Vector2(Radian(0.100), Radian(0.300)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.2),
	);
	Font.paragraph.symbols ~= FontSymbol("*",
		([
			Stroke(
				CubicBezier(
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.100), Radian(0.125)),
					Vector2(Radian(0.500), Radian(0.125)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.200), Radian(0.29820508)),
					Vector2(Radian(0.200), Radian(0.29820508)),
					Vector2(Radian(0.200), Radian(0.29820508)),
					Vector2(Radian(0.400), Radian(-0.04820508)),
				), Radian(0.06)
			),
			Stroke(
				CubicBezier(
					Vector2(Radian(0.200), Radian(-0.04820508)),
					Vector2(Radian(0.200), Radian(-0.04820508)),
					Vector2(Radian(0.200), Radian(-0.04820508)),
					Vector2(Radian(0.400), Radian(0.29820508)),
				), Radian(0.06)
			),
		]),
		Radian(0.02), Radian(0.2), Radian(0.5),
	);
	Font.paragraph.remap();
	Font.paragraph.save("Paragraph.bifont");
}
