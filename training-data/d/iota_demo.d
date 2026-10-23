import std.stdio;
import std.range : iota;
import std.algorithm : map, filter, sum;
import std.array : array;

void main() {
    writeln(iota(5));
    writeln(iota(2, 8));
    writeln(iota(0, 20, 5));

    auto squares = iota(1, 6).map!(x => x * x).array;
    writeln(squares);

    writeln(iota(1, 101).filter!(x => x % 3 == 0).sum);
}
