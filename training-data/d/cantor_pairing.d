import std.stdio;
import std.math : sqrt;
import std.typecons : tuple;

// Cantor pairing function and its inverse.
long pair(long x, long y) { return (x + y) * (x + y + 1) / 2 + y; }

auto unpair(long z) {
    long w = cast(long)((sqrt(8.0 * z + 1) - 1) / 2);
    long y = z - w * (w + 1) / 2;
    return tuple(w - y, y);
}

void main() {
    writeln(pair(3, 4));
    auto p = unpair(32);
    writeln(p[0], " ", p[1]);
}
