module bismuth.effect;

public import bismuth.effect.blur;
public import bismuth.effect.copy;
public import bismuth.effect.glass;
public import bismuth.effect.glass_stroke;
public import bismuth.effect.gradient;
public import bismuth.effect.shape;
public import bismuth.effect.stroke;
public import bismuth.framework;

public void initEffects () {
	initStroke();
	initGlassStroke();
	initShape();
}

public interface Effect {
	public VTexture draw ();
}
