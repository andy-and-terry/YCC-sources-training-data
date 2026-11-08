import std.stdio;

ubyte crc8(const(ubyte)[] data) {
    ubyte crc = 0;
    foreach (b; data) {
        crc ^= b;
        foreach (_; 0 .. 8)
            crc = (crc & 0x80) ? cast(ubyte)((crc << 1) ^ 0x07) : cast(ubyte)(crc << 1);
    }
    return crc;
}

void main() { writefln("%02x", crc8(cast(const(ubyte)[]) "123456789")); }
