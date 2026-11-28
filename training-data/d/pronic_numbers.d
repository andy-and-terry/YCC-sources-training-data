import std.algorithm, std.math, std.range, std.stdio;

bool isPronic(long x) {
    long n = cast(long) sqrt(cast(double) x);
    return n * (n + 1) == x;
}

void main() {
    writeln(iota(0, 10).map!(n => n * (n + 1))); // [0, 2, 6, 12, 20, 30, 42, 56, 72, 90]
    writeln(isPronic(56), " ", isPronic(57)); // true false
}
