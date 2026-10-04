import std.stdio;
import core.bitop;

void main() {
    uint x = 0b1011_0100;

    writeln(popcnt(x));
    writeln(bsf(x));
    writeln(bsr(x));
    writeln(((x >> 2) & 1) != 0);

    uint flags = 0;
    flags |= 1 << 3;
    flags |= 1 << 0;
    writefln("%08b", flags);
    flags &= ~(1 << 3);
    writefln("%08b", flags);
    flags ^= 0xFF;
    writefln("%08b", flags);

    writeln(x >> 2, " ", x << 2, " ", cast(byte) 0xF0 >> 2, " ", 0xF0 >>> 2);
    writefln("%x", bswap(0x11223344u));
    writeln(rol(0x80000001u, 1));
}
