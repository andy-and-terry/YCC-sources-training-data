import std.stdio;
import std.algorithm : map, filter, each;
import std.range : iota;

void main() {
    iota(1, 11)
        .filter!(n => n % 2 == 0)
        .map!(n => n * n)
        .each!(n => writeln(n));
}
