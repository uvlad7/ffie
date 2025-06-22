import std.stdio;
import terminal;
// 		"console-colors": "~>1.1.0",
// "targetType": "dynamicLibrary"

import core.stdc.stdlib;

extern (C) void bye_dittie()
{
    auto terminal = new Terminal();
    terminal.writeln("Bye from ", Foreground(176, 57, 50), "D", Foreground(Color.reset), "!");
}

extern (C) void hello_dittie()
{
	auto terminal = new Terminal();
    terminal.writeln("Hello from ", Foreground(176, 57, 50), "D", Foreground(Color.reset), "!");
    atexit(&bye_dittie);
}
