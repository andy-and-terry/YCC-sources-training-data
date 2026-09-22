#include <stdio.h>
#include <stdint.h>

/* Modular exponentiation: base^exp mod mod, avoiding overflow via
   64-bit intermediate multiplication. */
static uint64_t mulmod(uint64_t a, uint64_t b, uint64_t mod) {
    return (uint64_t)(((__uint128_t)a * b) % mod);
}

static uint64_t powmod(uint64_t base, uint64_t exp, uint64_t mod) {
    uint64_t result = 1;
    base %= mod;
    while (exp > 0) {
        if (exp & 1) result = mulmod(result, base, mod);
        base = mulmod(base, base, mod);
        exp >>= 1;
    }
    return result;
}

/* Deterministic Miller-Rabin for 64-bit integers using a fixed witness
   set known to be correct for all n < 3,317,044,064,679,887,385,961,981. */
int is_prime(uint64_t n) {
    if (n < 2) return 0;
    static const uint64_t small_primes[] = {2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37};
    for (size_t i = 0; i < sizeof(small_primes) / sizeof(small_primes[0]); i++) {
        uint64_t p = small_primes[i];
        if (n == p) return 1;
        if (n % p == 0) return 0;
    }

    uint64_t d = n - 1;
    int r = 0;
    while (d % 2 == 0) { d /= 2; r++; }

    uint64_t witnesses[] = {2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37};
    for (size_t w = 0; w < sizeof(witnesses) / sizeof(witnesses[0]); w++) {
        uint64_t a = witnesses[w];
        if (a >= n) continue;
        uint64_t x = powmod(a, d, n);
        if (x == 1 || x == n - 1) continue;

        int composite = 1;
        for (int i = 0; i < r - 1; i++) {
            x = mulmod(x, x, n);
            if (x == n - 1) { composite = 0; break; }
        }
        if (composite) return 0;
    }
    return 1;
}

int main(void) {
    uint64_t candidates[] = {2, 17, 91, 97, 561, 1000003, 1000000007};
    for (size_t i = 0; i < sizeof(candidates) / sizeof(candidates[0]); i++) {
        printf("%llu: %s\n", (unsigned long long)candidates[i],
               is_prime(candidates[i]) ? "prime" : "composite");
    }
    return 0;
}
