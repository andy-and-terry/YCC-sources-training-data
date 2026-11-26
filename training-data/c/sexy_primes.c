// Sexy primes below 100: (p, p + 6) both prime; expect 16.
#include <stdio.h>

static int is_prime(int n) {
    if (n < 2) return 0;
    for (int d = 2; d * d <= n; d++) if (n % d == 0) return 0;
    return 1;
}

int main(void) {
    int c = 0;
    for (int p = 2; p < 100; p++) if (is_prime(p) && is_prime(p + 6)) c++;
    printf("%d\n", c);
    return 0;
}
