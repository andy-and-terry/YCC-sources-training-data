import std.stdio, std.string, std.array;

void main() {
    auto parts = "a,b,c".split(",");
    writeln(parts.join("-"));
    writeln("  hi  ".strip);
}
