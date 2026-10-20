import std.stdio, std.algorithm, std.range;
void main() {
    auto r = iota(1, 20).filter!(n => n % 3 == 0).map!(n => n * n);
    writeln(r);
    writeln(r.sum);
}
