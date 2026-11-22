#include <stdio.h>

/* Emirps: primes whose digit reversal is a different prime. */
static int is_prime(int n) {
    if (n < 2) return 0;
    for (int d = 2; d * d <= n; d++)
        if (n % d == 0) return 0;
    return 1;
}

static int reverse(int n) {
    int r = 0;
    for (; n > 0; n /= 10) r = r * 10 + n % 10;
    return r;
}

int main(void) {
    for (int n = 2; n < 200; n++) {
        int r = reverse(n);
        if (r != n && is_prime(n) && is_prime(r)) printf("%d ", n);
    }
    printf("\n");
    return 0;
}
