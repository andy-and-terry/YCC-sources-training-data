import std.stdio, std.algorithm, std.range;

void main() {
    auto r = iota(1, 11).filter!(x => x % 2 == 0).map!(x => x * x);
    writeln(r);
    writeln(r.sum);
}
