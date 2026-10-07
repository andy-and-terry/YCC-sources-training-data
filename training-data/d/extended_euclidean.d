import std.stdio;

long extendedGcd(long a, long b, out long x, out long y) {
    if (b == 0) {
        x = 1;
        y = 0;
        return a;
    }
    long x1, y1;
    long g = extendedGcd(b, a % b, x1, y1);
    x = y1;
    y = x1 - (a / b) * y1;
    return g;
}

void main() {
    long x, y;
    long g = extendedGcd(35, 15, x, y);
    writeln("gcd=", g, " x=", x, " y=", y);
}
