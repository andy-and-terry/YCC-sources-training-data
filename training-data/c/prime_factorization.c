#include <stdio.h>

typedef struct {
    unsigned long long prime;
    int exp;
} factor_t;

int factorize(unsigned long long n, factor_t *out) {
    int k = 0;
    for (unsigned long long d = 2; d * d <= n; d += (d == 2 ? 1 : 2)) {
        if (n % d) continue;
        out[k].prime = d;
        out[k].exp = 0;
        while (n % d == 0) {
            n /= d;
            out[k].exp++;
        }
        k++;
    }
    if (n > 1) out[k++] = (factor_t){n, 1};
    return k;
}

int main(void) {
    unsigned long long tests[] = {360, 97, 1001, 82944, 600851475143ull};
    factor_t f[64];
    for (int t = 0; t < 5; t++) {
        int k = factorize(tests[t], f);
        printf("%llu =", tests[t]);
        for (int i = 0; i < k; i++) {
            printf("%s %llu", i ? " *" : "", f[i].prime);
            if (f[i].exp > 1) printf("^%d", f[i].exp);
        }
        printf("\n");
    }
    return 0;
}
