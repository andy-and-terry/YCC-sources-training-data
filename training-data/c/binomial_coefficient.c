#include <stdint.h>
#include <stdio.h>

/* Exact nCk without overflow for results that fit in 64 bits (uses gcd reduction). */
static uint64_t gcd(uint64_t a, uint64_t b) {
    while (b) {
        uint64_t t = a % b;
        a = b;
        b = t;
    }
    return a;
}

uint64_t choose(uint64_t n, uint64_t k) {
    if (k > n) return 0;
    if (k > n - k) k = n - k;
    uint64_t r = 1;
    for (uint64_t i = 1; i <= k; i++) {
        uint64_t num = n - k + i, den = i;
        uint64_t g = gcd(r, den);
        r /= g;
        den /= g;
        num /= den; /* den now divides num */
        r *= num;
    }
    return r;
}

int main(void) {
    printf("%llu %llu %llu %llu\n", (unsigned long long)choose(10, 3), (unsigned long long)choose(52, 5),
           (unsigned long long)choose(60, 30), (unsigned long long)choose(66, 33));
    return 0;
}
