import std.stdio;

// n(n+1)/2+1
long term(long n) {
    return ((n * (n + 1)) / 2) + 1;
}

void main() {
    foreach (n; 1 .. 16)
        writefln("%2d -> %d", n, term(n));
}
