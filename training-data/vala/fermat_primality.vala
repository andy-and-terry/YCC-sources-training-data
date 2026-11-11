// Fermat primality test; Carmichael number 561 fools it.
uint64 powmod (uint64 b, uint64 e, uint64 m) {
    uint64 r = 1;
    b %= m;
    while (e > 0) {
        if ((e & 1) == 1) r = r * b % m;
        b = b * b % m;
        e >>= 1;
    }
    return r;
}

bool probably_prime (uint64 n) {
    return n > 2 && powmod (2, n - 1, n) == 1;
}

void main () {
    uint64[] tests = { 97, 91, 561 };
    foreach (var n in tests) {
        print ("%llu %s\n", n, probably_prime (n).to_string ());
    }
}
