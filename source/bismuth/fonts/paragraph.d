module bismuth.fonts.paragraph;

import bismuth;

void buildFont () {
	Font.paragraph = new Font();
	Font.paragraph.name = "Paragraph";
	Font.paragraph.author = "https://github.com/icosahedroninstrumentality";
	Font.paragraph.created = 1784435893000;
	Font.paragraph.symbols ~= FontSymbol("",
		([
			Stroke(
				CubicBezier(
					Vector2(0.10, -0.75),
					Vector2(0.10, -0.75),
					Vector2(0.10, -0.75),
					Vector2(0.10,  0.75),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(1.00, -0.75),
					Vector2(1.00, -0.75),
					Vector2(1.00, -0.75),
					Vector2(1.00,  0.75),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.10,  0.75),
					Vector2(0.10,  0.75),
					Vector2(0.10,  0.75),
					Vector2(1.00,  0.75),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.10, -0.75),
					Vector2(0.10, -0.75),
					Vector2(0.10, -0.75),
					Vector2(1.00, -0.75),
				), 0.06
			)
		]),
		0.0, 0.0, 1.1,
	);
	Font.paragraph.symbols ~= FontSymbol(" ", ([]), 0.0, 0.0, 0.3);
	Font.paragraph.symbols ~= FontSymbol("A",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100, -0.25),
					Vector2(0.100, -0.25),
					Vector2(0.100, -0.25),
					Vector2(0.350,  0.50),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.350,  0.50),
					Vector2(0.350,  0.50),
					Vector2(0.350,  0.50),
					Vector2(0.600, -0.25),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.183,  0.00),
					Vector2(0.183,  0.00),
					Vector2(0.183,  0.00),
					Vector2(0.516,  0.00),
				), 0.06
			),
		]),
		0.02, 0.2, 0.7,
	);
	Font.paragraph.symbols ~= FontSymbol("B",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.350,  0.500),
					Vector2(0.500,  0.500),
					Vector2(0.600,  0.500),
					Vector2(0.600,  0.300),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.600,  0.300),
					Vector2(0.600,  0.125),
					Vector2(0.500,  0.125),
					Vector2(0.350,  0.125),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.350,  0.125),
					Vector2(0.500,  0.125),
					Vector2(0.600,  0.125),
					Vector2(0.600, -0.050),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.600, -0.050),
					Vector2(0.600, -0.250),
					Vector2(0.500, -0.250),
					Vector2(0.350, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.350, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.125),
					Vector2(0.100,  0.125),
					Vector2(0.100,  0.125),
					Vector2(0.350,  0.125),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.350,  0.500),
				), 0.06
			),
		]),
		0.02, 0.2, 0.7,
	);
	Font.paragraph.symbols ~= FontSymbol("C",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.125),
					Vector2(0.100,  0.275),
					Vector2(0.100,  0.500),
					Vector2(0.350,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.350,  0.500),
					Vector2(0.600,  0.500),
					Vector2(0.600,  0.3125),
					Vector2(0.600,  0.3125),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.125),
					Vector2(0.100, -0.025),
					Vector2(0.100, -0.250),
					Vector2(0.350, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.350, -0.250),
					Vector2(0.600, -0.250),
					Vector2(0.600, -0.0625),
					Vector2(0.600, -0.0625),
				), 0.06
			),
		]),
		0.02, 0.2, 0.7,
	);
	Font.paragraph.symbols ~= FontSymbol("D",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.350,  0.500),
					Vector2(0.600,  0.500),
					Vector2(0.600,  0.300),
					Vector2(0.600,  0.125),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.350, -0.250),
					Vector2(0.600, -0.250),
					Vector2(0.600, -0.075),
					Vector2(0.600,  0.125),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.350, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.350,  0.500),
				), 0.06
			),
		]),
		0.02, 0.2, 0.7,
	);
	Font.paragraph.symbols ~= FontSymbol("E",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.600,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.600, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.125),
					Vector2(0.100,  0.125),
					Vector2(0.100,  0.125),
					Vector2(0.400,  0.125),
				), 0.06
			),
		]),
		0.02, 0.2, 0.7,
	);
	Font.paragraph.symbols ~= FontSymbol("F",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.600,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.125),
					Vector2(0.100,  0.125),
					Vector2(0.100,  0.125),
					Vector2(0.400,  0.125),
				), 0.06
			),
		]),
		0.02, 0.2, 0.7,
	);
	Font.paragraph.symbols ~= FontSymbol("G",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.125),
					Vector2(0.100,  0.250),
					Vector2(0.100,  0.500),
					Vector2(0.350,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.125),
					Vector2(0.100,  0.000),
					Vector2(0.100, -0.250),
					Vector2(0.350, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.350,  0.500),
					Vector2(0.600,  0.500),
					Vector2(0.600,  0.3125),
					Vector2(0.600,  0.3125),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.350, -0.250),
					Vector2(0.350, -0.250),
					Vector2(0.600, -0.250),
					Vector2(0.600, -0.125),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.600, -0.125),
					Vector2(0.600, -0.125),
					Vector2(0.600, -0.125),
					Vector2(0.600,  0.125),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.600,  0.125),
					Vector2(0.600,  0.125),
					Vector2(0.600,  0.125),
					Vector2(0.400,  0.125),
				), 0.06
			),
		]),
		0.02, 0.2, 0.7,
	);
	Font.paragraph.symbols ~= FontSymbol("H",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.600, -0.250),
					Vector2(0.600, -0.250),
					Vector2(0.600, -0.250),
					Vector2(0.600,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.125),
					Vector2(0.100,  0.125),
					Vector2(0.100,  0.125),
					Vector2(0.600,  0.125),
				), 0.06
			),
		]),
		0.02, 0.2, 0.7,
	);
	Font.paragraph.symbols ~= FontSymbol("I",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100,  0.500),
				), 0.06
			),
		]),
		0.02, 0.2, 0.2,
	);
	Font.paragraph.symbols ~= FontSymbol("J",
		([
			Stroke(
				CubicBezier(
					Vector2(0.400,  0.000),
					Vector2(0.400,  0.000),
					Vector2(0.400,  0.000),
					Vector2(0.400,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.400,  0.000),
					Vector2(0.400, -0.250),
					Vector2(0.300, -0.250),
					Vector2(0.200, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100, -0.125),
					Vector2(0.100, -0.250),
					Vector2(0.300, -0.250),
					Vector2(0.200, -0.250),
				), 0.06
			),
		]),
		0.02, 0.2, 0.5,
	);
	Font.paragraph.symbols ~= FontSymbol("K",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.000),
					Vector2(0.100,  0.000),
					Vector2(0.100,  0.000),
					Vector2(0.600,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.225,  0.125),
					Vector2(0.225,  0.125),
					Vector2(0.225,  0.125),
					Vector2(0.600, -0.250),
				), 0.06
			),
		]),
		0.02, 0.2, 0.7,
	);
	Font.paragraph.symbols ~= FontSymbol("L",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.600, -0.250),
				), 0.06
			),
		]),
		0.02, 0.2, 0.7,
	);
	Font.paragraph.symbols ~= FontSymbol("M",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.600, -0.250),
					Vector2(0.600, -0.250),
					Vector2(0.600, -0.250),
					Vector2(0.600,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.350,  0.125),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.600,  0.500),
					Vector2(0.600,  0.500),
					Vector2(0.600,  0.500),
					Vector2(0.350,  0.125),
				), 0.06
			),
		]),
		0.02, 0.2, 0.7,
	);
	Font.paragraph.symbols ~= FontSymbol("N",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.600, -0.250),
					Vector2(0.600, -0.250),
					Vector2(0.600, -0.250),
					Vector2(0.600,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.600, -0.250),
				), 0.06
			),
		]),
		0.02, 0.2, 0.7,
	);
	Font.paragraph.symbols ~= FontSymbol("O",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.125),
					Vector2(0.100,  0.250),
					Vector2(0.100,  0.500),
					Vector2(0.350,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.600,  0.125),
					Vector2(0.600,  0.250),
					Vector2(0.600,  0.500),
					Vector2(0.350,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.125),
					Vector2(0.100,  0.000),
					Vector2(0.100, -0.250),
					Vector2(0.350, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.600,  0.125),
					Vector2(0.600,  0.000),
					Vector2(0.600, -0.250),
					Vector2(0.350, -0.250),
				), 0.06
			),
		]),
		0.02, 0.2, 0.7,
	);
	Font.paragraph.symbols ~= FontSymbol("P",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.350,  0.500),
					Vector2(0.500,  0.500),
					Vector2(0.600,  0.500),
					Vector2(0.600,  0.300),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.600,  0.300),
					Vector2(0.600,  0.125),
					Vector2(0.500,  0.125),
					Vector2(0.350,  0.125),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.125),
					Vector2(0.100,  0.125),
					Vector2(0.100,  0.125),
					Vector2(0.350,  0.125),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.350,  0.500),
				), 0.06
			),
		]),
		0.02, 0.2, 0.7,
	);
	Font.paragraph.symbols ~= FontSymbol("Q",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.125),
					Vector2(0.100,  0.250),
					Vector2(0.100,  0.500),
					Vector2(0.350,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.600,  0.125),
					Vector2(0.600,  0.250),
					Vector2(0.600,  0.500),
					Vector2(0.350,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.125),
					Vector2(0.100,  0.000),
					Vector2(0.100, -0.250),
					Vector2(0.350, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.600,  0.125),
					Vector2(0.600,  0.000),
					Vector2(0.600, -0.250),
					Vector2(0.350, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.350,  0.000),
					Vector2(0.350,  0.000),
					Vector2(0.350,  0.000),
					Vector2(0.600, -0.250),
				), 0.06
			),
		]),
		0.02, 0.2, 0.7,
	);
	Font.paragraph.symbols ~= FontSymbol("R",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.350,  0.500),
					Vector2(0.500,  0.500),
					Vector2(0.600,  0.500),
					Vector2(0.600,  0.300),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.600,  0.300),
					Vector2(0.600,  0.125),
					Vector2(0.500,  0.125),
					Vector2(0.350,  0.125),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.125),
					Vector2(0.100,  0.125),
					Vector2(0.100,  0.125),
					Vector2(0.350,  0.125),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.350,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.350,  0.125),
					Vector2(0.350,  0.125),
					Vector2(0.600,  0.125),
					Vector2(0.600, -0.250),
				), 0.06
			),
		]),
		0.02, 0.2, 0.7,
	);
	Font.paragraph.symbols ~= FontSymbol("S",
		([
			Stroke(
				CubicBezier(
					Vector2(0.350,  0.125),
					Vector2(0.200,  0.125),
					Vector2(0.100,  0.125),
					Vector2(0.100,  0.3125),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.350,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.3125),
					Vector2(0.100,  0.3125),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.350,  0.500),
					Vector2(0.600,  0.500),
					Vector2(0.600,  0.3125),
					Vector2(0.600,  0.3125),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.350, 0.125),
					Vector2(0.500, 0.125),
					Vector2(0.600, 0.125),
					Vector2(0.600, -0.0625),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.350, -0.25),
					Vector2(0.600, -0.25),
					Vector2(0.600, -0.0625),
					Vector2(0.600, -0.0625),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.350, -0.25),
					Vector2(0.100, -0.25),
					Vector2(0.100, -0.0625),
					Vector2(0.100, -0.0625),
				), 0.06
			),
		]),
		0.02, 0.2, 0.7,
	);
	Font.paragraph.symbols ~= FontSymbol("T",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.600,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.350,  0.500),
					Vector2(0.350,  0.500),
					Vector2(0.350,  0.500),
					Vector2(0.350, -0.250),
				), 0.06
			),
		]),
		0.02, 0.2, 0.7,
	);
	Font.paragraph.symbols ~= FontSymbol("U",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.100, -0.050),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.600,  0.500),
					Vector2(0.600,  0.500),
					Vector2(0.600,  0.500),
					Vector2(0.600, -0.050),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.350, -0.250),
					Vector2(0.350, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.050),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.350, -0.250),
					Vector2(0.350, -0.250),
					Vector2(0.600, -0.250),
					Vector2(0.600, -0.050),
				), 0.06
			),
		]),
		0.02, 0.2, 0.7,
	);
	Font.paragraph.symbols ~= FontSymbol("V",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.350, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.600,  0.500),
					Vector2(0.600,  0.500),
					Vector2(0.600,  0.500),
					Vector2(0.350, -0.250),
				), 0.06
			),
		]),
		0.02, 0.2, 0.7,
	);
	Font.paragraph.symbols ~= FontSymbol("W",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.300, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.500),
					Vector2(0.500,  0.500),
					Vector2(0.500,  0.500),
					Vector2(0.300, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.500),
					Vector2(0.500,  0.500),
					Vector2(0.500,  0.500),
					Vector2(0.700, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.900,  0.500),
					Vector2(0.900,  0.500),
					Vector2(0.900,  0.500),
					Vector2(0.700, -0.250),
				), 0.06
			),
		]),
		0.02, 0.2, 1.0,
	);
	Font.paragraph.symbols ~= FontSymbol("X",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.600, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.600,  0.500),
					Vector2(0.600,  0.500),
					Vector2(0.600,  0.500),
					Vector2(0.100, -0.250),
				), 0.06
			),
		]),
		0.02, 0.2, 0.7,
	);
	Font.paragraph.symbols ~= FontSymbol("Y",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.350,  0.125),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.600,  0.500),
					Vector2(0.600,  0.500),
					Vector2(0.600,  0.500),
					Vector2(0.350,  0.125),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.350,  0.125),
					Vector2(0.350, -0.250),
					Vector2(0.350, -0.250),
					Vector2(0.350, -0.250),
				), 0.06
			),
		]),
		0.02, 0.2, 0.7,
	);
	Font.paragraph.symbols ~= FontSymbol("Z",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.600,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.600,  0.500),
					Vector2(0.600,  0.500),
					Vector2(0.600,  0.500),
					Vector2(0.100, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.600, -0.250),
				), 0.06
			),
		]),
		0.02, 0.2, 0.7,
	);
	Font.paragraph.symbols ~= FontSymbol("a",
		([
			Stroke(
				CubicBezier(
					Vector2(0.300,  0.250),
					Vector2(0.100,  0.250),
					Vector2(0.100,  0.125),
					Vector2(0.100,  0.125),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.000),
					Vector2(0.500,  0.100),
					Vector2(0.500,  0.250),
					Vector2(0.300,  0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.000),
					Vector2(0.500,  0.000),
					Vector2(0.500,  0.000),
					Vector2(0.500, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.000),
					Vector2(0.300,  0.000),
					Vector2(0.100,  0.000),
					Vector2(0.100, -0.125),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100, -0.125),
					Vector2(0.100, -0.250),
					Vector2(0.200, -0.250),
					Vector2(0.300, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500, -0.125),
					Vector2(0.500, -0.125),
					Vector2(0.500, -0.250),
					Vector2(0.300, -0.250),
				), 0.06
			),
		]),
		0.02, 0.2, 0.6,
	);
	Font.paragraph.symbols ~= FontSymbol("b",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.100, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.000),
					Vector2(0.100,  0.100),
					Vector2(0.100,  0.250),
					Vector2(0.300,  0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.000),
					Vector2(0.500,  0.100),
					Vector2(0.500,  0.250),
					Vector2(0.300,  0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.000),
					Vector2(0.100, -0.100),
					Vector2(0.100, -0.250),
					Vector2(0.300, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.000),
					Vector2(0.500, -0.100),
					Vector2(0.500, -0.250),
					Vector2(0.300, -0.250),
				), 0.06
			),
		]),
		0.02, 0.2, 0.6,
	);
	Font.paragraph.symbols ~= FontSymbol("c",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.000),
					Vector2(0.100,  0.100),
					Vector2(0.100,  0.250),
					Vector2(0.300,  0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.300,  0.250),
					Vector2(0.300,  0.250),
					Vector2(0.500,  0.250),
					Vector2(0.500,  0.125),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.000),
					Vector2(0.100, -0.100),
					Vector2(0.100, -0.250),
					Vector2(0.300, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.300, -0.250),
					Vector2(0.300, -0.250),
					Vector2(0.500, -0.250),
					Vector2(0.500, -0.125),
				), 0.06
			),
		]),
		0.02, 0.2, 0.6,
	);
	Font.paragraph.symbols ~= FontSymbol("d",
		([
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.500),
					Vector2(0.500,  0.500),
					Vector2(0.500,  0.500),
					Vector2(0.500, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.000),
					Vector2(0.100,  0.100),
					Vector2(0.100,  0.250),
					Vector2(0.300,  0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.000),
					Vector2(0.500,  0.100),
					Vector2(0.500,  0.250),
					Vector2(0.300,  0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.000),
					Vector2(0.100, -0.100),
					Vector2(0.100, -0.250),
					Vector2(0.300, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.000),
					Vector2(0.500, -0.100),
					Vector2(0.500, -0.250),
					Vector2(0.300, -0.250),
				), 0.06
			),
		]),
		0.02, 0.2, 0.6,
	);
	Font.paragraph.symbols ~= FontSymbol("e",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.000),
					Vector2(0.100,  0.100),
					Vector2(0.100,  0.250),
					Vector2(0.300,  0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.000),
					Vector2(0.500,  0.100),
					Vector2(0.500,  0.250),
					Vector2(0.300,  0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.000),
					Vector2(0.100, -0.100),
					Vector2(0.100, -0.250),
					Vector2(0.300, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.300, -0.250),
					Vector2(0.300, -0.250),
					Vector2(0.500, -0.250),
					Vector2(0.500, -0.200),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.000),
					Vector2(0.100,  0.000),
					Vector2(0.100,  0.000),
					Vector2(0.500,  0.000),
				), 0.06
			),
		]),
		0.02, 0.2, 0.6,
	);
	Font.paragraph.symbols ~= FontSymbol("f",
		([
			Stroke(
				CubicBezier(
					Vector2(0.200, -0.250),
					Vector2(0.200,  0.250),
					Vector2(0.200,  0.250),
					Vector2(0.200,  0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.200,  0.250),
					Vector2(0.200,  0.375),
					Vector2(0.200,  0.500),
					Vector2(0.300,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.250),
					Vector2(0.100,  0.250),
					Vector2(0.100,  0.250),
					Vector2(0.300,  0.250),
				), 0.06
			),
		]),
		0.02, 0.2, 0.4,
	);
	Font.paragraph.symbols ~= FontSymbol("g",
		([
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.250),
					Vector2(0.500,  0.250),
					Vector2(0.500,  0.250),
					Vector2(0.500, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500, -0.250),
					Vector2(0.500, -0.375),
					Vector2(0.500, -0.500),
					Vector2(0.300, -0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.300, -0.500),
					Vector2(0.300, -0.500),
					Vector2(0.100, -0.500),
					Vector2(0.100, -0.375),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.000),
					Vector2(0.100,  0.100),
					Vector2(0.100,  0.250),
					Vector2(0.300,  0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.000),
					Vector2(0.500,  0.100),
					Vector2(0.500,  0.250),
					Vector2(0.300,  0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.000),
					Vector2(0.100, -0.100),
					Vector2(0.100, -0.250),
					Vector2(0.300, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.000),
					Vector2(0.500, -0.100),
					Vector2(0.500, -0.250),
					Vector2(0.300, -0.250),
				), 0.06
			),
		]),
		0.02, 0.2, 0.6,
	);
	Font.paragraph.symbols ~= FontSymbol("h",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.100, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.000),
					Vector2(0.100,  0.100),
					Vector2(0.100,  0.250),
					Vector2(0.300,  0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.000),
					Vector2(0.500,  0.100),
					Vector2(0.500,  0.250),
					Vector2(0.300,  0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.000),
					Vector2(0.100,  0.000),
					Vector2(0.100,  0.000),
					Vector2(0.100, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.000),
					Vector2(0.500,  0.000),
					Vector2(0.500,  0.000),
					Vector2(0.500, -0.250),
				), 0.06
			),
		]),
		0.02, 0.2, 0.6,
	);
	Font.paragraph.symbols ~= FontSymbol("i",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.250),
					Vector2(0.100,  0.250),
					Vector2(0.100,  0.250),
					Vector2(0.100, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
				), 0.06
			),
		]),
		0.02, 0.2, 0.2,
	);
	Font.paragraph.symbols ~= FontSymbol("j",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.250),
					Vector2(0.100,  0.250),
					Vector2(0.100,  0.250),
					Vector2(0.100, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.375),
					Vector2(0.100, -0.500),
					Vector2(0.000, -0.500),
				), 0.06
			),
		]),
		0.02, 0.2, 0.2,
	);
	Font.paragraph.symbols ~= FontSymbol("k",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.100, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100, -0.150),
					Vector2(0.100, -0.150),
					Vector2(0.100, -0.150),
					Vector2(0.500,  0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.250,  0.000),
					Vector2(0.250,  0.000),
					Vector2(0.250,  0.000),
					Vector2(0.500, -0.250),
				), 0.06
			),
		]),
		0.02, 0.2, 0.6,
	);
	Font.paragraph.symbols ~= FontSymbol("l",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.000),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.000),
					Vector2(0.100, -0.125),
					Vector2(0.100, -0.250),
					Vector2(0.200, -0.250),
				), 0.06
			),
		]),
		0.02, 0.2, 0.3,
	);
	Font.paragraph.symbols ~= FontSymbol("m",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.250),
					Vector2(0.100,  0.250),
					Vector2(0.100,  0.250),
					Vector2(0.100, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.000),
					Vector2(0.100,  0.100),
					Vector2(0.100,  0.250),
					Vector2(0.300,  0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.000),
					Vector2(0.500,  0.100),
					Vector2(0.500,  0.250),
					Vector2(0.300,  0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.000),
					Vector2(0.100,  0.000),
					Vector2(0.100,  0.000),
					Vector2(0.100, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.000),
					Vector2(0.500,  0.000),
					Vector2(0.500,  0.000),
					Vector2(0.500, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.000),
					Vector2(0.500,  0.100),
					Vector2(0.500,  0.250),
					Vector2(0.700,  0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.900,  0.000),
					Vector2(0.900,  0.100),
					Vector2(0.900,  0.250),
					Vector2(0.700,  0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.000),
					Vector2(0.500,  0.000),
					Vector2(0.500,  0.000),
					Vector2(0.500, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.900,  0.000),
					Vector2(0.900,  0.000),
					Vector2(0.900,  0.000),
					Vector2(0.900, -0.250),
				), 0.06
			),
		]),
		0.02, 0.2, 1.0,
	);
	Font.paragraph.symbols ~= FontSymbol("n",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.250),
					Vector2(0.100,  0.250),
					Vector2(0.100,  0.250),
					Vector2(0.100, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.000),
					Vector2(0.100,  0.100),
					Vector2(0.100,  0.250),
					Vector2(0.300,  0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.000),
					Vector2(0.500,  0.100),
					Vector2(0.500,  0.250),
					Vector2(0.300,  0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.000),
					Vector2(0.100,  0.000),
					Vector2(0.100,  0.000),
					Vector2(0.100, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.000),
					Vector2(0.500,  0.000),
					Vector2(0.500,  0.000),
					Vector2(0.500, -0.250),
				), 0.06
			),
		]),
		0.02, 0.2, 0.6,
	);
	Font.paragraph.symbols ~= FontSymbol("o",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.000),
					Vector2(0.100,  0.100),
					Vector2(0.100,  0.250),
					Vector2(0.300,  0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.000),
					Vector2(0.500,  0.100),
					Vector2(0.500,  0.250),
					Vector2(0.300,  0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.000),
					Vector2(0.100, -0.100),
					Vector2(0.100, -0.250),
					Vector2(0.300, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.000),
					Vector2(0.500, -0.100),
					Vector2(0.500, -0.250),
					Vector2(0.300, -0.250),
				), 0.06
			),
		]),
		0.02, 0.2, 0.6,
	);
	Font.paragraph.symbols ~= FontSymbol("p",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.250),
					Vector2(0.100,  0.250),
					Vector2(0.100,  0.250),
					Vector2(0.100, -0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.000),
					Vector2(0.100,  0.100),
					Vector2(0.100,  0.250),
					Vector2(0.300,  0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.000),
					Vector2(0.500,  0.100),
					Vector2(0.500,  0.250),
					Vector2(0.300,  0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.000),
					Vector2(0.100, -0.100),
					Vector2(0.100, -0.250),
					Vector2(0.300, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.000),
					Vector2(0.500, -0.100),
					Vector2(0.500, -0.250),
					Vector2(0.300, -0.250),
				), 0.06
			),
		]),
		0.02, 0.2, 0.6,
	);
	Font.paragraph.symbols ~= FontSymbol("q",
		([
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.250),
					Vector2(0.500,  0.250),
					Vector2(0.500,  0.250),
					Vector2(0.500, -0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.000),
					Vector2(0.100,  0.100),
					Vector2(0.100,  0.250),
					Vector2(0.300,  0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.000),
					Vector2(0.500,  0.100),
					Vector2(0.500,  0.250),
					Vector2(0.300,  0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.000),
					Vector2(0.100, -0.100),
					Vector2(0.100, -0.250),
					Vector2(0.300, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.000),
					Vector2(0.500, -0.100),
					Vector2(0.500, -0.250),
					Vector2(0.300, -0.250),
				), 0.06
			),
		]),
		0.02, 0.2, 0.6,
	);
	Font.paragraph.symbols ~= FontSymbol("r",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.250),
					Vector2(0.100,  0.250),
					Vector2(0.100,  0.250),
					Vector2(0.100, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.000),
					Vector2(0.100,  0.125),
					Vector2(0.100,  0.250),
					Vector2(0.300,  0.250),
				), 0.06
			),
		]),
		0.02, 0.2, 0.4,
	);
	Font.paragraph.symbols ~= FontSymbol("s",
		([
			Stroke(
				CubicBezier(
					Vector2(0.300,  0.000),
					Vector2(0.200,  0.000),
					Vector2(0.100,  0.000),
					Vector2(0.100,  0.125),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.300,  0.250),
					Vector2(0.300,  0.250),
					Vector2(0.100,  0.250),
					Vector2(0.100,  0.125),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.300,  0.250),
					Vector2(0.300,  0.250),
					Vector2(0.500,  0.250),
					Vector2(0.500,  0.125),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.300,  0.000),
					Vector2(0.400,  0.000),
					Vector2(0.500,  0.000),
					Vector2(0.500, -0.125),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.300, -0.250),
					Vector2(0.300, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.125),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.300, -0.250),
					Vector2(0.300, -0.250),
					Vector2(0.500, -0.250),
					Vector2(0.500, -0.125),
				), 0.06
			),
		]),
		0.02, 0.2, 0.6,
	);
	Font.paragraph.symbols ~= FontSymbol("t",
		([
			Stroke(
				CubicBezier(
					Vector2(0.200,  0.500),
					Vector2(0.200,  0.500),
					Vector2(0.200,  0.500),
					Vector2(0.200,  0.000),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.200,  0.000),
					Vector2(0.200, -0.125),
					Vector2(0.200, -0.250),
					Vector2(0.300, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.250),
					Vector2(0.100,  0.250),
					Vector2(0.100,  0.250),
					Vector2(0.300,  0.250),
				), 0.06
			),
		]),
		0.02, 0.2, 0.4,
	);
	Font.paragraph.symbols ~= FontSymbol("u",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.000),
					Vector2(0.100,  0.000),
					Vector2(0.100,  0.000),
					Vector2(0.100,  0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500, -0.250),
					Vector2(0.500, -0.250),
					Vector2(0.500, -0.250),
					Vector2(0.500,  0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.000),
					Vector2(0.100, -0.100),
					Vector2(0.100, -0.250),
					Vector2(0.300, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.000),
					Vector2(0.500, -0.100),
					Vector2(0.500, -0.250),
					Vector2(0.300, -0.250),
				), 0.06
			),
		]),
		0.02, 0.2, 0.6,
	);
	Font.paragraph.symbols ~= FontSymbol("v",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.250),
					Vector2(0.100,  0.250),
					Vector2(0.100,  0.250),
					Vector2(0.300, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.250),
					Vector2(0.500,  0.250),
					Vector2(0.500,  0.250),
					Vector2(0.300, -0.250),
				), 0.06
			),
		]),
		0.02, 0.2, 0.6,
	);
	Font.paragraph.symbols ~= FontSymbol("w",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.250),
					Vector2(0.100,  0.250),
					Vector2(0.100,  0.250),
					Vector2(0.250, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.400,  0.250),
					Vector2(0.400,  0.250),
					Vector2(0.400,  0.250),
					Vector2(0.250, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.400,  0.250),
					Vector2(0.400,  0.250),
					Vector2(0.400,  0.250),
					Vector2(0.550, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.700,  0.250),
					Vector2(0.700,  0.250),
					Vector2(0.700,  0.250),
					Vector2(0.550, -0.250),
				), 0.06
			),
		]),
		0.02, 0.2, 0.8,
	);
	Font.paragraph.symbols ~= FontSymbol("x",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.250),
					Vector2(0.100,  0.250),
					Vector2(0.100,  0.250),
					Vector2(0.500, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.250),
					Vector2(0.500,  0.250),
					Vector2(0.500,  0.250),
					Vector2(0.100, -0.250),
				), 0.06
			),
		]),
		0.02, 0.2, 0.6,
	);
	Font.paragraph.symbols ~= FontSymbol("y",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.250),
					Vector2(0.100,  0.250),
					Vector2(0.100,  0.250),
					Vector2(0.300, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.250),
					Vector2(0.500,  0.250),
					Vector2(0.500,  0.250),
					Vector2(0.300, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.300, -0.250),
					Vector2(0.200, -0.500),
					Vector2(0.200, -0.500),
					Vector2(0.100, -0.500),
				), 0.06
			),
		]),
		0.02, 0.2, 0.6,
	);
	Font.paragraph.symbols ~= FontSymbol("z",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.250),
					Vector2(0.100,  0.250),
					Vector2(0.100,  0.250),
					Vector2(0.500,  0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.250),
					Vector2(0.500,  0.250),
					Vector2(0.500,  0.250),
					Vector2(0.100, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.500, -0.250),
				), 0.06
			),
		]),
		0.02, 0.2, 0.6,
	);
	Font.paragraph.symbols ~= FontSymbol("0",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.125),
					Vector2(0.100,  0.250),
					Vector2(0.100,  0.500),
					Vector2(0.300,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.125),
					Vector2(0.500,  0.250),
					Vector2(0.500,  0.500),
					Vector2(0.300,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.125),
					Vector2(0.100,  0.000),
					Vector2(0.100, -0.250),
					Vector2(0.300, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.125),
					Vector2(0.500,  0.000),
					Vector2(0.500, -0.250),
					Vector2(0.300, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.300,  0.250),
					Vector2(0.300,  0.250),
					Vector2(0.300,  0.250),
					Vector2(0.300,  0.000),
				), 0.04
			),
		]),
		0.02, 0.2, 0.6,
	);
	Font.paragraph.symbols ~= FontSymbol("1",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.500, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.300, -0.250),
					Vector2(0.300, -0.250),
					Vector2(0.300, -0.250),
					Vector2(0.300,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.300,  0.500),
					Vector2(0.300,  0.500),
					Vector2(0.300,  0.500),
					Vector2(0.100,  0.300),
				), 0.06
			),
		]),
		0.02, 0.2, 0.6,
	);
	Font.paragraph.symbols ~= FontSymbol("2",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.500, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.375),
					Vector2(0.150,  0.500),
					Vector2(0.250,  0.500),
					Vector2(0.300,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.375),
					Vector2(0.500,  0.500),
					Vector2(0.350,  0.500),
					Vector2(0.300,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.375),
					Vector2(0.500,  0.125),
					Vector2(0.100,  0.000),
					Vector2(0.100, -0.250),
				), 0.06
			),
		]),
		0.02, 0.2, 0.6,
	);
	Font.paragraph.symbols ~= FontSymbol("3",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.3125),
					Vector2(0.100,  0.3125),
					Vector2(0.100,  0.500),
					Vector2(0.300,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.3125),
					Vector2(0.500,  0.3125),
					Vector2(0.500,  0.500),
					Vector2(0.300,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.3125),
					Vector2(0.500,  0.3125),
					Vector2(0.500,  0.125),
					Vector2(0.300,  0.125),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500, -0.0625),
					Vector2(0.500, -0.0625),
					Vector2(0.500,  0.125),
					Vector2(0.300,  0.125),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100, -0.0625),
					Vector2(0.100, -0.0625),
					Vector2(0.100, -0.25),
					Vector2(0.300, -0.25),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500, -0.0625),
					Vector2(0.500, -0.0625),
					Vector2(0.500, -0.25),
					Vector2(0.300, -0.25),
				), 0.06
			),
		]),
		0.02, 0.2, 0.6,
	);
	Font.paragraph.symbols ~= FontSymbol("4",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.125),
					Vector2(0.100,  0.125),
					Vector2(0.100,  0.125),
					Vector2(0.500,  0.125),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.400, -0.250),
					Vector2(0.400, -0.250),
					Vector2(0.400, -0.250),
					Vector2(0.400,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.400,  0.500),
					Vector2(0.400,  0.500),
					Vector2(0.400,  0.500),
					Vector2(0.100,  0.125),
				), 0.06
			),
		]),
		0.02, 0.2, 0.6,
	);
	Font.paragraph.symbols ~= FontSymbol("5",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.500,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.125),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.000),
					Vector2(0.500,  0.100),
					Vector2(0.500,  0.250),
					Vector2(0.300,  0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.300,  0.250),
					Vector2(0.100,  0.250),
					Vector2(0.100,  0.125),
					Vector2(0.100,  0.125),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.000),
					Vector2(0.500, -0.100),
					Vector2(0.500, -0.250),
					Vector2(0.300, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.300, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.125),
					Vector2(0.100, -0.125),
				), 0.06
			),
		]),
		0.02, 0.2, 0.6,
	);
	Font.paragraph.symbols ~= FontSymbol("6",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.125),
					Vector2(0.100,  0.250),
					Vector2(0.100,  0.500),
					Vector2(0.300,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.3125),
					Vector2(0.500,  0.3125),
					Vector2(0.500,  0.500),
					Vector2(0.300,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.125),
					Vector2(0.100,  0.000),
					Vector2(0.100, -0.250),
					Vector2(0.300, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500, -0.0625),
					Vector2(0.500, -0.0625),
					Vector2(0.500, -0.250),
					Vector2(0.300, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500, -0.0625),
					Vector2(0.500, -0.0625),
					Vector2(0.500,  0.125),
					Vector2(0.300,  0.125),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.125),
					Vector2(0.100,  0.125),
					Vector2(0.100,  0.125),
					Vector2(0.300,  0.125),
				), 0.06
			),
		]),
		0.02, 0.2, 0.6,
	);
	Font.paragraph.symbols ~= FontSymbol("7",
		([
			Stroke(
				CubicBezier(
					Vector2(0.200, -0.250),
					Vector2(0.200, -0.250),
					Vector2(0.200, -0.250),
					Vector2(0.500,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.500,  0.500),
				), 0.06
			),
		]),
		0.02, 0.2, 0.6,
	);
	Font.paragraph.symbols ~= FontSymbol("8",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.3125),
					Vector2(0.100,  0.3125),
					Vector2(0.100,  0.500),
					Vector2(0.300,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.3125),
					Vector2(0.500,  0.3125),
					Vector2(0.500,  0.500),
					Vector2(0.300,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.3125),
					Vector2(0.100,  0.3125),
					Vector2(0.100,  0.125),
					Vector2(0.300,  0.125),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.3125),
					Vector2(0.500,  0.3125),
					Vector2(0.500,  0.125),
					Vector2(0.300,  0.125),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100, -0.0625),
					Vector2(0.100, -0.0625),
					Vector2(0.100,  0.125),
					Vector2(0.300,  0.125),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500, -0.0625),
					Vector2(0.500, -0.0625),
					Vector2(0.500,  0.125),
					Vector2(0.300,  0.125),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100, -0.0625),
					Vector2(0.100, -0.0625),
					Vector2(0.100, -0.25),
					Vector2(0.300, -0.25),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500, -0.0625),
					Vector2(0.500, -0.0625),
					Vector2(0.500, -0.25),
					Vector2(0.300, -0.25),
				), 0.06
			),
		]),
		0.02, 0.2, 0.6,
	);
	Font.paragraph.symbols ~= FontSymbol("9",
		([
			Stroke(
				CubicBezier(
					Vector2(0.6-0.100, 0.25-0.125),
					Vector2(0.6-0.100, 0.25-0.250),
					Vector2(0.6-0.100, 0.25-0.500),
					Vector2(0.6-0.300, 0.25-0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.6-0.500, 0.25-0.3125),
					Vector2(0.6-0.500, 0.25-0.3125),
					Vector2(0.6-0.500, 0.25-0.500),
					Vector2(0.6-0.300, 0.25-0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.6-0.100, 0.25- 0.125),
					Vector2(0.6-0.100, 0.25- 0.000),
					Vector2(0.6-0.100, 0.25- -0.250),
					Vector2(0.6-0.300, 0.25- -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.6-0.500, 0.25- -0.0625),
					Vector2(0.6-0.500, 0.25- -0.0625),
					Vector2(0.6-0.500, 0.25- -0.250),
					Vector2(0.6-0.300, 0.25- -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.6-0.500, 0.25- -0.0625),
					Vector2(0.6-0.500, 0.25- -0.0625),
					Vector2(0.6-0.500, 0.25-  0.125),
					Vector2(0.6-0.300, 0.25-  0.125),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.6-0.100, 0.25- 0.125),
					Vector2(0.6-0.100, 0.25- 0.125),
					Vector2(0.6-0.100, 0.25- 0.125),
					Vector2(0.6-0.300, 0.25- 0.125),
				), 0.06
			),
		]),
		0.02, 0.2, 0.6,
	);
	Font.paragraph.symbols ~= FontSymbol(".",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
				), 0.06
			),
		]),
		0.02, 0.2, 0.2,
	);
	Font.paragraph.symbols ~= FontSymbol(":",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.250),
					Vector2(0.100,  0.250),
					Vector2(0.100,  0.250),
					Vector2(0.100,  0.250),
				), 0.06
			),
		]),
		0.02, 0.2, 0.2,
	);
	Font.paragraph.symbols ~= FontSymbol(",",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.070, -0.400),
				), 0.06
			),
		]),
		0.02, 0.2, 0.2,
	);
	Font.paragraph.symbols ~= FontSymbol(";",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.250),
					Vector2(0.100,  0.250),
					Vector2(0.100,  0.250),
					Vector2(0.100,  0.250),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.070, -0.400),
				), 0.06
			),
		]),
		0.02, 0.2, 0.2,
	);
	Font.paragraph.symbols ~= FontSymbol("!",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100, -0.100),
					Vector2(0.100, -0.100),
					Vector2(0.100, -0.100),
					Vector2(0.100,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
				), 0.06
			),
		]),
		0.02, 0.2, 0.2,
	);
	Font.paragraph.symbols ~= FontSymbol("?",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.300),
					Vector2(0.100,  0.300),
					Vector2(0.100,  0.500),
					Vector2(0.300,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.300),
					Vector2(0.500,  0.300),
					Vector2(0.500,  0.500),
					Vector2(0.300,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.500,  0.300),
					Vector2(0.500,  0.100),
					Vector2(0.300,  0.100),
					Vector2(0.300, -0.100),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.300, -0.250),
					Vector2(0.300, -0.250),
					Vector2(0.300, -0.250),
					Vector2(0.300, -0.250),
				), 0.06
			),
		]),
		0.02, 0.2, 0.6,
	);
	Font.paragraph.symbols ~= FontSymbol("_",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100, -0.500),
					Vector2(0.100, -0.500),
					Vector2(0.100, -0.500),
					Vector2(0.600, -0.500),
				), 0.06
			),
		]),
		0.02, 0.2, 0.7,
	);
	Font.paragraph.symbols ~= FontSymbol("-",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.125),
					Vector2(0.100,  0.125),
					Vector2(0.100,  0.125),
					Vector2(0.500,  0.125),
				), 0.06
			),
		]),
		0.02, 0.2, 0.6,
	);
	Font.paragraph.symbols ~= FontSymbol("+",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.125),
					Vector2(0.100,  0.125),
					Vector2(0.100,  0.125),
					Vector2(0.500,  0.125),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.300,  0.325),
					Vector2(0.300,  0.325),
					Vector2(0.300,  0.325),
					Vector2(0.300, -0.125),
				), 0.06
			),
		]),
		0.02, 0.2, 0.6,
	);
	Font.paragraph.symbols ~= FontSymbol("/",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.300,  0.500),
				), 0.06
			),
		]),
		0.02, 0.2, 0.4,
	);
	Font.paragraph.symbols ~= FontSymbol("\\",
		([
			Stroke(
				CubicBezier(
					Vector2(0.300, -0.250),
					Vector2(0.300, -0.250),
					Vector2(0.300, -0.250),
					Vector2(0.100,  0.500),
				), 0.06
			),
		]),
		0.02, 0.2, 0.4,
	);
	Font.paragraph.symbols ~= FontSymbol("|",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.250),
					Vector2(0.100,  0.500),
				), 0.06
			),
		]),
		0.02, 0.2, 0.2,
	);
	Font.paragraph.symbols ~= FontSymbol("=",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.225),
					Vector2(0.100,  0.225),
					Vector2(0.100,  0.225),
					Vector2(0.500,  0.225),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100, -0.025),
					Vector2(0.100, -0.025),
					Vector2(0.100, -0.025),
					Vector2(0.500, -0.025),
				), 0.06
			),
		]),
		0.02, 0.2, 0.6,
	);
	Font.paragraph.symbols ~= FontSymbol("(",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.000),
					Vector2(0.100,  0.250),
					Vector2(0.100,  0.500),
					Vector2(0.300,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.000),
					Vector2(0.100, -0.250),
					Vector2(0.100, -0.500),
					Vector2(0.300, -0.500),
				), 0.06
			),
		]),
		0.02, 0.2, 0.4,
	);
	Font.paragraph.symbols ~= FontSymbol(")",
		([
			Stroke(
				CubicBezier(
					Vector2(0.300,  0.000),
					Vector2(0.300,  0.250),
					Vector2(0.300,  0.500),
					Vector2(0.100,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.300,  0.000),
					Vector2(0.300, -0.250),
					Vector2(0.300, -0.500),
					Vector2(0.100, -0.500),
				), 0.06
			),
		]),
		0.02, 0.2, 0.4,
	);
	Font.paragraph.symbols ~= FontSymbol("[",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.100, -0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.300,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100, -0.500),
					Vector2(0.100, -0.500),
					Vector2(0.100, -0.500),
					Vector2(0.300, -0.500),
				), 0.06
			),
		]),
		0.02, 0.2, 0.4,
	);
	Font.paragraph.symbols ~= FontSymbol("]",
		([
			Stroke(
				CubicBezier(
					Vector2(0.300,  0.500),
					Vector2(0.300,  0.500),
					Vector2(0.300,  0.500),
					Vector2(0.300, -0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.300,  0.500),
					Vector2(0.300,  0.500),
					Vector2(0.300,  0.500),
					Vector2(0.100,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.300, -0.500),
					Vector2(0.300, -0.500),
					Vector2(0.300, -0.500),
					Vector2(0.100, -0.500),
				), 0.06
			),
		]),
		0.02, 0.2, 0.4,
	);
	Font.paragraph.symbols ~= FontSymbol("{",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.000),
					Vector2(0.300,  0.000),
					Vector2(0.100,  0.500),
					Vector2(0.300,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.000),
					Vector2(0.300,  0.000),
					Vector2(0.100, -0.500),
					Vector2(0.300, -0.500),
				), 0.06
			),
		]),
		0.02, 0.2, 0.4,
	);
	Font.paragraph.symbols ~= FontSymbol("}",
		([
			Stroke(
				CubicBezier(
					Vector2(0.300,  0.000),
					Vector2(0.100,  0.000),
					Vector2(0.300,  0.500),
					Vector2(0.100,  0.500),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.300,  0.000),
					Vector2(0.100,  0.000),
					Vector2(0.300, -0.500),
					Vector2(0.100, -0.500),
				), 0.06
			),
		]),
		0.02, 0.2, 0.4,
	);
	Font.paragraph.symbols ~= FontSymbol("<",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.000),
					Vector2(0.100,  0.000),
					Vector2(0.100,  0.000),
					Vector2(0.400,  0.300),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.000),
					Vector2(0.100,  0.000),
					Vector2(0.100,  0.000),
					Vector2(0.400, -0.300),
				), 0.06
			),
		]),
		0.02, 0.2, 0.5,
	);
	Font.paragraph.symbols ~= FontSymbol(">",
		([
			Stroke(
				CubicBezier(
					Vector2(0.400,  0.000),
					Vector2(0.400,  0.000),
					Vector2(0.400,  0.000),
					Vector2(0.100,  0.300),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.400,  0.000),
					Vector2(0.400,  0.000),
					Vector2(0.400,  0.000),
					Vector2(0.100, -0.300),
				), 0.06
			),
		]),
		0.02, 0.2, 0.5,
	);
	Font.paragraph.symbols ~= FontSymbol("\"",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.300),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.300,  0.500),
					Vector2(0.300,  0.500),
					Vector2(0.300,  0.500),
					Vector2(0.300,  0.300),
				), 0.06
			),
		]),
		0.02, 0.2, 0.4,
	);
	Font.paragraph.symbols ~= FontSymbol("'",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.500),
					Vector2(0.100,  0.300),
				), 0.06
			),
		]),
		0.02, 0.2, 0.2,
	);
	Font.paragraph.symbols ~= FontSymbol("*",
		([
			Stroke(
				CubicBezier(
					Vector2(0.100,  0.125),
					Vector2(0.100,  0.125),
					Vector2(0.100,  0.125),
					Vector2(0.500,  0.125),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.200,  0.29820508),
					Vector2(0.200,  0.29820508),
					Vector2(0.200,  0.29820508),
					Vector2(0.400, -0.04820508),
				), 0.06
			),
			Stroke(
				CubicBezier(
					Vector2(0.200, -0.04820508),
					Vector2(0.200, -0.04820508),
					Vector2(0.200, -0.04820508),
					Vector2(0.400,  0.29820508),
				), 0.06
			),
		]),
		0.02, 0.2, 0.5,
	);
	Font.paragraph.remap();
	Font.paragraph.save("Paragraph.bifont");
}
