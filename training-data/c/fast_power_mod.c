#include <stdint.h>
#include <stdio.h>

static uint64_t mul_mod(uint64_t a, uint64_t b, uint64_t m) {
    return (uint64_t)((unsigned __int128)a * b % m);
}

uint64_t pow_mod(uint64_t base, uint64_t exp, uint64_t mod) {
    uint64_t result = 1 % mod;
    base %= mod;
    while (exp) {
        if (exp & 1) result = mul_mod(result, base, mod);
        base = mul_mod(base, base, mod);
        exp >>= 1;
    }
    return result;
}

/* Deterministic Miller-Rabin for all 64-bit n. */
int is_prime(uint64_t n) {
    if (n < 2) return 0;
    static const uint64_t bases[] = {2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37};
    for (int i = 0; i < 12; i++) {
        if (n % bases[i] == 0) return n == bases[i];
    }
    uint64_t d = n - 1;
    int r = 0;
    while (!(d & 1)) {
        d >>= 1;
        r++;
    }
    for (int i = 0; i < 12; i++) {
        uint64_t x = pow_mod(bases[i], d, n);
        if (x == 1 || x == n - 1) continue;
        int composite = 1;
        for (int k = 1; k < r && composite; k++) {
            x = mul_mod(x, x, n);
            if (x == n - 1) composite = 0;
        }
        if (composite) return 0;
    }
    return 1;
}

int main(void) {
    printf("%llu %llu %llu\n", (unsigned long long)pow_mod(2, 10, 1000), (unsigned long long)pow_mod(3, 200, 13),
           (unsigned long long)pow_mod(7, 1000000000000000000ull, 1000000007));
    uint64_t tests[] = {97, 561, 1000000007, 18446744073709551557ull, 18446744073709551559ull};
    for (int i = 0; i < 5; i++) printf("%llu prime? %d\n", (unsigned long long)tests[i], is_prime(tests[i]));
    return 0;
}
