#include <stdio.h>

static int is_prime(int n) {
    if (n < 2) return 0;
    for (int d = 2; d * d <= n; d++)
        if (n % d == 0) return 0;
    return 1;
}

/* Pernicious numbers: the number of 1 bits is prime. */
int main(void) {
    for (int n = 1; n <= 20; n++)
        if (is_prime(__builtin_popcount(n))) printf("%d ", n);
    printf("\n");
    return 0;
}
