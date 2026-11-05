import std.stdio, std.range, std.algorithm;

void main() {
    auto r = iota(1, 11).filter!(x => x % 2 == 1).map!(x => x * x);
    writeln(r);
    writeln(r.sum);
}
