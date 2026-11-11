// Centered square numbers 2n(n+1)+1
import std.stdio;
import std.range : iota;
import std.algorithm : map;

long term(long n) { return ((2 * n) * (n + 1)) + 1; }

void main() {
    writeln(iota(0, 10).map!(n => term(n)));
}
