/* Emirps: primes whose digit reversal is a different prime. */
#include <stdio.h>

static int is_prime(int n) {
    if (n < 2) return 0;
    for (int i = 2; i * i <= n; i++)
        if (n % i == 0) return 0;
    return 1;
}

static int reverse(int n) {
    int r = 0;
    while (n) { r = r * 10 + n % 10; n /= 10; }
    return r;
}

int main(void) {
    for (int n = 2; n < 100; n++) {
        int r = reverse(n);
        if (r != n && is_prime(n) && is_prime(r))
            printf("%d ", n);
    }
    printf("\n");
    return 0;
}
