// Carmichael numbers: composite n where a^(n-1) = 1 (mod n) for all a coprime to n.
int64 gcd (int64 a, int64 b) {
    while (b != 0) {
        int64 t = a % b;
        a = b;
        b = t;
    }
    return a;
}

int64 pow_mod (int64 b, int64 e, int64 m) {
    int64 r = 1;
    b %= m;
    while (e > 0) {
        if ((e & 1) == 1) r = r * b % m;
        b = b * b % m;
        e >>= 1;
    }
    return r;
}

bool is_prime (int64 n) {
    for (int64 p = 2; p * p <= n; p++) {
        if (n % p == 0) return false;
    }
    return n > 1;
}

bool is_carmichael (int64 n) {
    if (is_prime (n)) return false;
    for (int64 a = 2; a < n; a++) {
        if (gcd (a, n) == 1 && pow_mod (a, n - 1, n) != 1) return false;
    }
    return true;
}

void main () {
    for (int64 n = 3; n < 3000; n += 2) {
        if (is_carmichael (n)) print ("%lld ", n);
    }
    print ("\n");
}
