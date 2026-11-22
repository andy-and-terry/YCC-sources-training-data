#include <stdio.h>

/* Twin primes: pairs (p, p+2) both prime; print the lesser of each pair. */
static int is_prime(int n) {
    if (n < 2) return 0;
    for (int d = 2; d * d <= n; d++)
        if (n % d == 0) return 0;
    return 1;
}

int main(void) {
    for (int p = 2; p < 100; p++)
        if (is_prime(p) && is_prime(p + 2)) printf("%d ", p);
    printf("\n");
    return 0;
}
