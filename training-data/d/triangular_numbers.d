import std.stdio, std.range, std.algorithm;

void main() {
    auto tri = iota(1, 11).cumulativeFold!((a, b) => a + b);
    writeln(tri);
}
