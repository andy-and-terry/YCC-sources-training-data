// Circular primes below 100; expect 13.
#include <stdio.h>

static int is_prime(int n) {
    if (n < 2) return 0;
    for (int d = 2; d * d <= n; d++) if (n % d == 0) return 0;
    return 1;
}

static int circular(int n) {
    int digits = 1, p = 1, m = n;
    while (m >= 10) { m /= 10; p *= 10; digits++; }
    int x = n;
    for (int i = 0; i < digits; i++) {
        if (!is_prime(x)) return 0;
        x = (x % 10) * p + x / 10;
    }
    return 1;
}

int main(void) {
    int c = 0;
    for (int n = 2; n < 100; n++) if (circular(n)) c++;
    printf("%d\n", c);
    return 0;
}
