import std.stdio;
import std.algorithm : filter;
import std.range : iota;

// Fibbinary numbers: no two adjacent 1 bits.
void main() {
    foreach (n; iota(0, 50).filter!(n => (n & (n >> 1)) == 0))
        write(n, " ");
    writeln();
}
