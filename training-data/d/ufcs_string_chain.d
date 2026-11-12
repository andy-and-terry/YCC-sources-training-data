import std.stdio, std.string, std.array;
void main() {
    "  hello world  ".strip.split.map!(w => w.capitalize).join(" ").writeln;
}
