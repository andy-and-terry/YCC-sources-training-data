import std.stdio;
import std.numeric : gcd;
import std.math : abs;

ulong rho(ulong n) {
    if (n % 2 == 0) return 2;
    ulong f(ulong v) { return (v * v + 1) % n; }
    ulong x = 2, y = 2, d = 1;
    while (d == 1) {
        x = f(x); y = f(f(y));
        d = gcd(x > y ? x - y : y - x, n);
    }
    return d;
}

void main() {
    ulong n = 8051, p = rho(n);
    writefln("%s = %s * %s", n, p, n / p);
}
