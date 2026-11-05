import std.stdio;

void main() {
    int[string] m = ["a": 1, "b": 2];
    if ("a" in m) writeln("has a");
    m.remove("a");
    writeln(m.length);
    foreach (k, v; m) writeln(k, " ", v);
}
