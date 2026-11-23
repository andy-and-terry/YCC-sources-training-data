import std.stdio;

// 3n(n-1)+1
long term(long n) {
    return ((3 * n) * (n - 1)) + 1;
}

void main() {
    foreach (n; 1 .. 16)
        writefln("%2d -> %d", n, term(n));
}
