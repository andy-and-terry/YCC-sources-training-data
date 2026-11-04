import std.stdio;
import std.conv : to, parse;

void main() {
    foreach (b; [2, 8, 16, 36])
        writefln("255 in base %d = %s", b, to!string(255, b));
    string hex = "ff";
    writeln(parse!int(hex, 16));
}
