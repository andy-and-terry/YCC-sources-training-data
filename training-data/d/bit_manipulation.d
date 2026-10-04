import std.stdio;
import core.bitop : popcnt, bsf, bsr;

bool isSet(uint x, int bit) { return (x >> bit) & 1; }
uint setBit(uint x, int bit) { return x | (1u << bit); }
uint clearBit(uint x, int bit) { return x & ~(1u << bit); }
uint toggleBit(uint x, int bit) { return x ^ (1u << bit); }

void main()
{
    uint x = 0b1011_0100;
    writefln("x        = %08b", x);
    writefln("popcnt   = %d", popcnt(x));
    writefln("lowest   = %d, highest = %d", bsf(x), bsr(x));
    writefln("set 0    = %08b", setBit(x, 0));
    writefln("clear 2  = %08b", clearBit(x, 2));
    writefln("toggle 7 = %08b", toggleBit(x, 7));
    writeln("bit 4 set? ", isSet(x, 4));
    writefln("lowest set bit isolated = %08b", x & -x);
}
