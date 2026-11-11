// Tetrahedral numbers n(n+1)(n+2)/6
import std.stdio;
import std.range : iota;
import std.algorithm : map;

long term(long n) { return ((n * (n + 1)) * (n + 2))/6; }

void main() {
    writeln(iota(0, 10).map!(n => term(n)));
}
