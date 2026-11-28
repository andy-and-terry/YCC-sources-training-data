import std.stdio;

ushort fletcher16(const(ubyte)[] data) {
    uint s1 = 0, s2 = 0;
    foreach (b; data) {
        s1 = (s1 + b) % 255;
        s2 = (s2 + s1) % 255;
    }
    return cast(ushort)((s2 << 8) | s1);
}

void main() {
    writefln("%x", fletcher16(cast(const(ubyte)[]) "abcde"));
}
