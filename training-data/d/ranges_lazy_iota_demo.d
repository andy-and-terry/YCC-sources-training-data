import std.stdio;
import std.range : iota, take, stride, zip;
import std.algorithm : map, filter, sum;

void main() {
    auto squares = iota(1, 100).map!(x => x * x).filter!(x => x % 2 == 1).take(5);
    writeln(squares);
    writeln(iota(0, 20).stride(5));
    writeln(iota(1, 11).sum);
    foreach (a, b; zip([1, 2, 3], ["a", "b", "c"]))
        writeln(a, b);
}
