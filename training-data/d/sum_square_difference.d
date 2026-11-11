// Square of the sum minus sum of squares for 1..10 (expect 2640)
import std.stdio;
import std.range : iota;
import std.algorithm : map, sum;

void main() {
    auto xs = iota(1, 11);
    auto total = xs.sum;
    auto squares = xs.map!(x => x * x).sum;
    writeln(total * total - squares);
}
