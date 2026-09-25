#include <stdio.h>
#include <stdlib.h>

unsigned long long phi(unsigned long long n) {
    unsigned long long result = n;
    for (unsigned long long p = 2; p * p <= n; p++) {
        if (n % p == 0) {
            while (n % p == 0) n /= p;
            result -= result / p;
        }
    }
    if (n > 1) result -= result / n;
    return result;
}

int main(void) {
    enum { LIMIT = 1000000 };
    unsigned *t = malloc((LIMIT + 1) * sizeof *t);
    if (!t) return 1;
    for (unsigned i = 0; i <= LIMIT; i++) t[i] = i;
    for (unsigned i = 2; i <= LIMIT; i++)
        if (t[i] == i)
            for (unsigned j = i; j <= LIMIT; j += i) t[j] -= t[j] / i;
    for (unsigned n = 1; n <= 20; n++) printf("%u ", t[n]);
    printf("\n");
    unsigned long long sum = 0;
    for (unsigned i = 2; i <= LIMIT; i++) sum += t[i];
    printf("reduced fractions with d <= 1e6: %llu, phi(10^12) = %llu\n", sum, phi(1000000000000ull));
    free(t);
    return 0;
}
