import std.stdio;
import core.bitop : popcnt, bsf, bsr;

bool isSet(uint value, int bit) {
    return (value & (1u << bit)) != 0;
}

uint setBit(uint value, int bit) {
    return value | (1u << bit);
}

uint clearBit(uint value, int bit) {
    return value & ~(1u << bit);
}

uint toggleBit(uint value, int bit) {
    return value ^ (1u << bit);
}

void main() {
    uint x = 0b1011_0100;
    writefln("%08b", x);
    writeln(isSet(x, 2), " ", isSet(x, 3));
    writefln("%08b", setBit(x, 0));
    writefln("%08b", clearBit(x, 7));
    writefln("%08b", toggleBit(x, 4));
    writeln("popcount: ", popcnt(x));
    writeln("lowest set: ", bsf(x), " highest set: ", bsr(x));
    writeln(x >> 2, " ", x << 1, " ", cast(int)(-16) >>> 28);
}
