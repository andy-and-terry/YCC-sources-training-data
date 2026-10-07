#include <stdio.h>
#include <stdint.h>

static uint64_t mulmod(uint64_t a, uint64_t b, uint64_t mod) {
    return (uint64_t)((__uint128_t)a * b % mod);
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

/* Deterministic for all 64-bit n using this fixed witness set. */
static int is_prime(uint64_t n) {
    if (n < 2) return 0;
    for (uint64_t p = 2; p <= 7; p++) {
        if (n == p) return 1;
        if (n % p == 0) return 0;
    }

    uint64_t d = n - 1;
    int r = 0;
    while (d % 2 == 0) {
        d /= 2;
        r++;
    }

    uint64_t witnesses[] = {2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37};
    for (size_t i = 0; i < sizeof(witnesses) / sizeof(witnesses[0]); i++) {
        uint64_t a = witnesses[i];
        if (a >= n) continue;
        uint64_t x = powmod(a, d, n);
        if (x == 1 || x == n - 1) continue;

        int composite = 1;
        for (int j = 0; j < r - 1; j++) {
            x = mulmod(x, x, n);
            if (x == n - 1) {
                composite = 0;
                break;
            }
        }
        if (composite) return 0;
    }
    return 1;
}

int main(void) {
    uint64_t candidates[] = {2, 17, 561, 997, 1000003, 1000000007ULL, 1000000006ULL};
    size_t count = sizeof(candidates) / sizeof(candidates[0]);
    for (size_t i = 0; i < count; i++) {
        printf("%llu is %s\n", (unsigned long long)candidates[i],
               is_prime(candidates[i]) ? "prime" : "composite");
    }
    return 0;
}
