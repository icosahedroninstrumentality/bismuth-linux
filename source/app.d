import core.thread;

import bismuth;
import audio;
import prototypes;
import std.stdio;

void main() {
	new Thread(() => runVideo()).start();
}
