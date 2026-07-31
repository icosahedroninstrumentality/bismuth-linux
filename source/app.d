import core.thread;

import bismuth;
import audio;
import prototypes;
import std.stdio;

void main() {
	writeln("Welcome to Bismuth!");
	new Thread(() => runVideo()).start();
}
