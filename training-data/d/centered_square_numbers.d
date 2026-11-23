import std.stdio;

// 2n(n-1)+1
long term(long n) {
    return ((2 * n) * (n - 1)) + 1;
}

void main() {
    foreach (n; 1 .. 16)
        writefln("%2d -> %d", n, term(n));
}
