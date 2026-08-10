module bismuth.framework.ui;

import bismuth.framework;

class Window {
	public __gshared Window[] all;
	public __gshared Window[] focused;

	public string title = "New Window";
	public Vector4 rect = Vector4(Radian(0), Radian(0), Radian(0), Radian(0));
	public bool inFocus = false;

	public Element root;
	public Element[] content;

	this () {
		root = new Element();
	}

	VTexture refresh () {
		return root.refresh();
	}
}

class Element {
	private VTexture vt;

	public Vector4 rect;
	
	public Element parent;
	public Element[] children;
	
	public VTexture delegate (Element) draw;
	
	Optional!VTexture refresh () {
		if (vt !is null) if (vt.cached) return vt;
		if (draw is null) return null;
		vt = draw(this);
		return vt;
	}
}

class Effect {
	this (VTexture delegate () drawCall) {}
}
