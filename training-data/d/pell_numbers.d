import std.stdio;

// P(n) = 2*P(n-1) + P(n-2), with P(0) = 0 and P(1) = 1
void main() {
    long a = 0, b = 1;
    foreach (i; 0 .. 15) {
        writefln("P(%d) = %d", i, a);
        auto next = 2 * b + a;
        a = b;
        b = next;
    }
}
