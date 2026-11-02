import std.stdio, std.array, std.algorithm;

void main() {
    int[string] m = ["b": 2, "a": 1, "c": 3];
    writeln(m.keys.sort.array);
    writeln("a" in m ? "has a" : "no a");
}
