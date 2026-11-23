import std.stdio;

// n^2(n+1)/2
long term(long n) {
    return ((n * n) * (n + 1)) / 2;
}

void main() {
    foreach (n; 1 .. 16)
        writefln("%2d -> %d", n, term(n));
}
