import std.stdio, std.math, std.range, std.algorithm;

bool isPerfectSquare(long n) {
    if (n < 0) return false;
    long r = cast(long) sqrt(cast(double) n);
    return r * r == n;
}

void main() {
    writeln(iota(0, 30).filter!(n => isPerfectSquare(n)));
}
