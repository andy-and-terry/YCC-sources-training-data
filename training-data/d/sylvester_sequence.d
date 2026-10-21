import std.bigint;
import std.stdio;

// Sylvester's sequence: s(0) = 2, s(n+1) = s(n)^2 - s(n) + 1
void main() {
    BigInt s = 2;
    foreach (i; 0 .. 8) {
        writefln("s(%d) = %s", i, s);
        s = s * s - s + 1;
    }
}
