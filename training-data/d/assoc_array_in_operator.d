import std.stdio;
void main() {
    int[string] m = ["a": 1, "b": 2];
    if (auto p = "a" in m) writeln(*p);
    writeln("z" in m ? "yes" : "no");
    m.remove("a");
    writeln(m.length);
}
