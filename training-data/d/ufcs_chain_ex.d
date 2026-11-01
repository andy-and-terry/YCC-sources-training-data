import std.stdio, std.string, std.conv;

int doubled(int x) { return x * 2; }

void main() {
    writeln(5.doubled.doubled);
    writeln("  hello  ".strip.toUpper);
    writeln("42".to!int + 1);
}
