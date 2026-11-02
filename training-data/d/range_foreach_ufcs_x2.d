import std.stdio, std.algorithm, std.range;

void main() {
    auto r = iota(1, 11).filter!(a => a % 2 == 0).map!(a => a * a);
    writeln(r.array);
}
