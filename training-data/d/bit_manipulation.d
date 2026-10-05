import std.stdio;
import core.bitop;

bool isPowerOfTwo(uint n) { return n != 0 && (n & (n - 1)) == 0; }

void main() {
    uint v = 0b1011_0100;
    writefln("%b", v);
    writeln("popcnt: ", popcnt(v));
    writeln("lowest set bit index: ", bsf(v));
    writeln("highest set bit index: ", bsr(v));
    writefln("set bit 0: %b", v | 1u);
    writefln("clear bit 2: %b", v & ~(1u << 2));
    writefln("toggle bit 7: %b", v ^ (1u << 7));
    writeln("lowest set bit isolated: ", v & -v);
    writeln(isPowerOfTwo(64), " ", isPowerOfTwo(66));
}
