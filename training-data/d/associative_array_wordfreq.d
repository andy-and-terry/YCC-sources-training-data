import std.stdio, std.string, std.algorithm, std.array;

void main() {
    int[string] c;
    foreach (w; "a b a c a".split) c[w]++;
    foreach (k; c.keys.sort) writeln(k, " ", c[k]);
}
