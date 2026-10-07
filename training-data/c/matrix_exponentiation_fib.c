#include <stdint.h>
#include <stdio.h>
#include <string.h>

#define MOD 1000000007ull

typedef struct { uint64_t m[2][2]; } mat2;

static mat2 mul(mat2 a, mat2 b) {
    mat2 c;
    memset(&c, 0, sizeof c);
    for (int i = 0; i < 2; i++)
        for (int k = 0; k < 2; k++)
            for (int j = 0; j < 2; j++) c.m[i][j] = (c.m[i][j] + a.m[i][k] * b.m[k][j]) % MOD;
    return c;
}

uint64_t fib(uint64_t n) {
    mat2 r = {{{1, 0}, {0, 1}}}, base = {{{1, 1}, {1, 0}}};
    for (; n; n >>= 1) {
        if (n & 1) r = mul(r, base);
        base = mul(base, base);
    }
    return r.m[0][1];
}

int main(void) {
    for (int i = 0; i < 15; i++) printf("%llu ", (unsigned long long)fib((uint64_t)i));
    printf("\nfib(1e18) mod 1e9+7 = %llu\n", (unsigned long long)fib(1000000000000000000ull));
    return 0;
}
