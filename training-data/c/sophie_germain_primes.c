#include <stdio.h>

static int is_prime(long n) {
    if (n < 2) return 0;
    for (long i = 2; i * i <= n; i++) if (n % i == 0) return 0;
    return 1;
}

int main(void) {
    int count = 0;
    for (long p = 2; count < 10; p++) {
        if (is_prime(p) && is_prime(2 * p + 1)) { printf("%ld ", p); count++; }
    }
    printf("\n"); /* 2 3 5 11 23 29 41 53 83 89 */
    return 0;
}
