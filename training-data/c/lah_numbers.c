#include <stdio.h>

/* Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5). */
static long fact(int n) { return n <= 1 ? 1 : n * fact(n - 1); }
static long comb(int n, int k) { return fact(n) / (fact(k) * fact(n - k)); }

int main(void) {
    int n = 5;
    for (int k = 1; k <= n; k++) printf("%ld ", comb(n - 1, k - 1) * fact(n) / fact(k));
    printf("\n");
    return 0;
}
