import std.stdio;

// n(n+1)(n+2)/6
long term(long n) {
    return ((n * (n + 1)) * (n + 2)) / 6;
}

void main() {
    foreach (n; 1 .. 16)
        writefln("%2d -> %d", n, term(n));
}
