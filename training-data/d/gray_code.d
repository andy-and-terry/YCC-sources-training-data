import std.stdio;

uint toGray(uint n) { return n ^ (n >> 1); }

uint fromGray(uint g) {
    uint n = 0;
    for (; g != 0; g >>= 1)
        n ^= g;
    return n;
}

void main() {
    foreach (i; 0 .. 8) {
        auto g = toGray(i);
        writefln("%d -> %03b -> %d", i, g, fromGray(g));
    }
}
