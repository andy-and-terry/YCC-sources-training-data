#include <stdio.h>

/* Carmichael numbers: composite n where a^(n-1) = 1 (mod n) for all a coprime to n. */
static long gcd(long a, long b) { return b ? gcd(b, a % b) : a; }

static long pow_mod(long b, long e, long m) {
    long r = 1;
    b %= m;
    for (; e > 0; e >>= 1) {
        if (e & 1) r = r * b % m;
        b = b * b % m;
    }
    return r;
}

static int is_prime(long n) {
    for (long p = 2; p * p <= n; p++)
        if (n % p == 0) return 0;
    return n > 1;
}

static int is_carmichael(long n) {
    if (is_prime(n)) return 0;
    for (long a = 2; a < n; a++)
        if (gcd(a, n) == 1 && pow_mod(a, n - 1, n) != 1) return 0;
    return 1;
}

int main(void) {
    for (long n = 3; n < 3000; n += 2)
        if (is_carmichael(n)) printf("%ld ", n);
    printf("\n");
    return 0;
}
