#include <cstdio>

/* Moebius function: 0 if n has a squared prime factor, else (-1)^k. */
static int mobius(int n) {
    int result = 1;
    for (int p = 2; p * p <= n; p++) {
        if (n % p == 0) {
            n /= p;
            if (n % p == 0) return 0;
            result = -result;
        }
    }
    return n > 1 ? -result : result;
}

int main(void) {
    for (int n = 1; n <= 30; n++) printf("%d ", mobius(n));
    printf("\n");
    return 0;
}
