module bismuth.text;

import bismuth;
import std.string;

public struct Stroke {
	CubicBezier bezier;
	Vector radius;
}

public struct FontSymbol {
	string match;
	Stroke[] strokes;
	Vector weightK;
	Vector italicsK;
	Vector advance;
}

private T safeExtract(T)(const(ubyte[]) data, size_t offset) {
	T value;
	(cast(ubyte*)&value)[0 .. T.sizeof] = data[offset .. offset + T.sizeof];
	return value;
}

public class Font {
	public __gshared Font paragraph;
	/// # not yet implemented
	public __gshared Font heading;
	/// # not yet implemented
	public __gshared Font mono;

	public static void setup () {
		import bismuth.fonts.paragraph : buildFont; buildFont();
	}

	public static Result!Font load(string path) {
		if (!path.endsWith(".bifont"))
			return new Result!Font(new Error("Wrong file type."));
	
		import std.file;
		immutable(ubyte[]) raw = (cast(ubyte[]) read(path)).idup;
	
		// Minimum size check (unchanged)
		enum minSize =
			2 + 2 + 8 + 8 +
			1 + 8 + 4 + 4;
		if (raw.length < minSize)
			return new Result!Font(new Error("Font file too small."));
	
		try {
			size_t index = 0;		   // use size_t for indexing
			Font font = new Font();
	
			// --- Title ---
			const titleLength = raw[index++];
			if (titleLength == 0)
				return new Result!Font(new Error("Font file is missing title."));
			font.name = cast(string)(raw[index .. index + titleLength]);
			index += titleLength;
	
			// --- Author ---
			const authorLength = raw[index++];
			if (authorLength == 0)
				return new Result!Font(new Error("Font file is missing author."));
			font.author = cast(string)(raw[index .. index + authorLength]);
			index += authorLength;
	
			// --- Created timestamp ---
			font.created = safeExtract!ulong(raw, index);
			index += ulong.sizeof;
	
			// --- Symbol count ---
			ulong symbolCount = safeExtract!ulong(raw, index);
			index += ulong.sizeof;
	
			// --- Read symbols ---
			for (ulong i = 0; i < symbolCount; i++) {
				FontSymbol sym;
	
				// Match string
				const matchLength = raw[index++];
				if (matchLength > 0) {
					sym.match = cast(string)(raw[index .. index + matchLength]);
					index += matchLength;
				} // else remains ""
	
				// Stroke count
				const strokeCount = raw[index++];
				sym.strokes = new Stroke[strokeCount];
				for (ubyte s = 0; s < strokeCount; s++) {
					sym.strokes[s] = safeExtract!Stroke(raw, index);
					index += Stroke.sizeof;
				}
	
				// Metrics
				sym.weightK  = safeExtract!Vector(raw, index); index += Vector.sizeof;
				sym.italicsK = safeExtract!Vector(raw, index); index += Vector.sizeof;
				sym.advance  = safeExtract!Vector(raw, index); index += Vector.sizeof;
	
				// **Store in the font's array FIRST, then take its address**
				font.symbols ~= sym;
				FontSymbol* symPtr = &font.symbols[$ - 1];
	
			}
			font.remap();
	
			// A font must contain a tofu (fallback) glyph
			if (font.tofu is null)
				return new Result!Font(new Error("Font file lacks a tofu (empty match) glyph."));
	
			return new Result!Font(font);
		} catch (Exception e) {
			return new Result!Font(new Error("Font file is broken."));
		}
	}

	string name;
	string author;
	ulong created;
	FontSymbol[] symbols = [];
	FontSymbol*[string][] mapped = [null]; // Symbol*[match][length], l0 is null
	FontSymbol* tofu;

	public void remap () {
		mapped = [null];
		tofu = null;
		for (ulong i = 0; i < symbols.length; i++) {
			FontSymbol* symPtr = &symbols[i];
			FontSymbol sym = *symPtr;
			if (sym.match == "") {
				tofu = symPtr;		  // now points into permanent storage
			} else {
				// Ensure the outer array is large enough
				if (sym.match.length >= mapped.length)
					mapped.length = sym.match.length + 1;
	
				if (mapped[sym.match.length] is null)
					mapped[sym.match.length] = new FontSymbol*[string];
	
				mapped[sym.match.length][sym.match] = symPtr;
			}
		}
	}

	public void drawText (
		string text,
		Vector2 position,
		Vector size,
		Vector weight, Vector
		italic,
		Vector maxWidth = Vector.infinity,
		Vector newLine = -2,
	) {
		FontSymbol*[] matches;

		size_t i = 0;
		size_t maxLen = mapped.length > 0 ? mapped.length - 1 : 0;

		while (i < text.length) {
			bool found = false;

			for (size_t len = maxLen; len >= 1; --len) {
				if (i + len > text.length)
					continue;

				if (len >= mapped.length || mapped[len] is null)
					continue;

				auto sub = text[i .. i + len];
				auto ptr = sub in mapped[len];
				if (ptr) {
					matches ~= *ptr;
					i += len;
					found = true;
					break;
				}
			}

			if (!found) {
				matches ~= tofu;
				++i; // advance past the unmatched character
			}
		}

		Vector2 offset = 0.0;
		int newlines = 0;
		foreach (FontSymbol* symbol; matches) {
			Stroke[] strokes = [];
			foreach (Stroke stroke; (*symbol).strokes) {
				strokes ~= Stroke(
					CubicBezier(
						position + (stroke.bezier.p0 + Vector2(stroke.bezier.p0.y * italic * (*symbol).italicsK, 0.0) + offset) * size,
						position + (stroke.bezier.p1 + Vector2(stroke.bezier.p1.y * italic * (*symbol).italicsK, 0.0) + offset) * size,
						position + (stroke.bezier.p2 + Vector2(stroke.bezier.p2.y * italic * (*symbol).italicsK, 0.0) + offset) * size,
						position + (stroke.bezier.p3 + Vector2(stroke.bezier.p3.y * italic * (*symbol).italicsK, 0.0) + offset) * size,
					), (stroke.radius + weight * (*symbol).weightK) * size
				);
			}
			if (strokes.length > 0) drawStroke((strokes), Color.zero, Color.one);
			offset.x += (*symbol).advance + weight * (*symbol).weightK * 2.0;
			import std.math : abs;
			if (abs(offset.x * size) > maxWidth) {
				newlines++;
				offset = Vector2(0, newLine * newlines); // shift down
			}
		}
	}

	public void save(string path) {
		import std.file : write;
		import std.exception : enforce;
		import std.conv : to;

		// Validate string lengths (must fit in a ubyte)
		enforce(name.length <= 255, "Font name too long.");
		enforce(author.length <= 255, "Font author too long.");

		// Build binary data
		ubyte[] data;

		// Title
		data ~= cast(ubyte) name.length;
		data ~= cast(ubyte[]) name;

		// Author
		data ~= cast(ubyte) author.length;
		data ~= cast(ubyte[]) author;

		// Created timestamp
		data ~= (cast(ubyte*) &created)[0 .. ulong.sizeof];

		// Symbol count
		ulong symCount = symbols.length;
		data ~= (cast(ubyte*) &symCount)[0 .. ulong.sizeof];

		// Symbols (must be written in the exact order they appear)
		foreach (sym; symbols) {
			// Match string
			enforce(sym.match.length <= 255, "Symbol match string too long.");
			data ~= cast(ubyte) sym.match.length;
			if (sym.match.length > 0)
				data ~= cast(ubyte[]) sym.match;

			// Stroke count (max 255)
			enforce(sym.strokes.length <= 255, "Too many strokes in a symbol.");
			data ~= cast(ubyte) sym.strokes.length;

			// Strokes
			foreach (stroke; sym.strokes) {
				// Write the binary representation of the whole Stroke struct.
				// Stroke.sizeof must exactly match the size used in load().
				auto ptr = cast(ubyte*) &stroke;
				data ~= ptr[0 .. Stroke.sizeof];
			}

			// weightK (Vector)
			{
				auto ptr = cast(ubyte*) &sym.weightK;
				data ~= ptr[0 .. Vector.sizeof];
			}

			// italicsK (Vector)
			{
				auto ptr = cast(ubyte*) &sym.italicsK;
				data ~= ptr[0 .. Vector.sizeof];
			}

			// advance (Vector)
			{
				auto ptr = cast(ubyte*) &sym.advance;
				data ~= ptr[0 .. Vector.sizeof];
			}
		}

		// Write file
		write(path, data);
	}
}
