// Fermat primality test; Carmichael number 561 fools it.
import std.stdio;

ulong powmod(ulong b, ulong e, ulong m) {
    ulong r = 1;
    b %= m;
    while (e > 0) {
        if (e & 1) r = r * b % m;
        b = b * b % m;
        e >>= 1;
    }
    return r;
}

bool probablyPrime(ulong n) {
    return n > 2 && powmod(2, n - 1, n) == 1;
}

void main() {
    foreach (n; [97UL, 91UL, 561UL])
        writeln(n, " ", probablyPrime(n));
}
