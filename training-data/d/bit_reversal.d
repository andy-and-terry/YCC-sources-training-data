import core.bitop : bitswap;
import std.stdio;

ubyte reverseBits(ubyte v) {
    ubyte r = 0;
    foreach (_; 0 .. 8) {
        r = cast(ubyte)((r << 1) | (v & 1));
        v >>= 1;
    }
    return r;
}

void main() {
    foreach (v; [1, 6, 13, 128])
        writeln(v, " ", reverseBits(cast(ubyte) v)); // 128 96 176 1
}
