import std.stdio;
import core.bitop;

void main() {
    uint n = 0b1011_0100;
    writeln(popcnt(n));
    writeln(bsf(n));   // index of lowest set bit
    writeln(bsr(n));   // index of highest set bit
    writeln(n & -n);
    writeln(n >> 2 & 1);
    writefln("%b", n ^ 0xFF);
    writefln("%b", rol(n, 4));
    writeln(bswap(0x01020304u) == 0x04030201u);
    writeln((n & (n - 1)) == 0);
}
