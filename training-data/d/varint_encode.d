import std.stdio;

ubyte[] varint(uint n) {
    ubyte[] o;
    while (n >= 0x80) {
        o ~= cast(ubyte)((n & 0x7F) | 0x80);
        n >>= 7;
    }
    o ~= cast(ubyte) n;
    return o;
}

void main() {
    foreach (b; varint(300)) writef("%02x ", b);
    writeln();
}
