import std.stdio;

// n(2n^2+1)/3
long term(long n) {
    return (n * (((2 * n) * n) + 1)) / 3;
}

void main() {
    foreach (n; 1 .. 16)
        writefln("%2d -> %d", n, term(n));
}
