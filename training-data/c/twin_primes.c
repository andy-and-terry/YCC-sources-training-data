// Twin primes below 100; expect 8.
#include <stdio.h>

static int is_prime(int n) {
    if (n < 2) return 0;
    for (int d = 2; d * d <= n; d++) if (n % d == 0) return 0;
    return 1;
}

int main(void) {
    int c = 0;
    for (int p = 2; p < 100; p++) if (is_prime(p) && is_prime(p + 2)) c++;
    printf("%d\n", c);
    return 0;
}
