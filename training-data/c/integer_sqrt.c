#include <math.h>
#include <stdint.h>
#include <stdio.h>

/* Bit-by-bit integer square root (no floating point). */
uint64_t isqrt(uint64_t n) {
    uint64_t res = 0, bit = 1ull << 62;
    while (bit > n) bit >>= 2;
    while (bit) {
        if (n >= res + bit) {
            n -= res + bit;
            res = (res >> 1) + bit;
        } else {
            res >>= 1;
        }
        bit >>= 2;
    }
    return res;
}

int main(void) {
    uint64_t tests[] = {0, 1, 15, 16, 17, 1000000, UINT64_MAX};
    for (int i = 0; i < 7; i++) {
        uint64_t r = isqrt(tests[i]);
        printf("isqrt(%llu) = %llu\n", (unsigned long long)tests[i], (unsigned long long)r);
    }
    return 0;
}
