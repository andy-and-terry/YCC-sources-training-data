import std.stdio, std.range, std.algorithm;
void main() {
    auto r = iota(1, 11).filter!(x => x % 2 == 0).map!(x => x * x);
    writeln(r);
    writeln(chain([1, 2], [3]).array);
}
