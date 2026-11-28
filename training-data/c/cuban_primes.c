#include <stdio.h>

static int is_prime(long n) {
    if (n < 2) return 0;
    for (long i = 2; i * i <= n; i++)
        if (n % i == 0) return 0;
    return 1;
}

int main(void) {
    int found = 0;
    for (long y = 1; found < 8; y++) {
        long p = 3 * y * y + 3 * y + 1;
        if (is_prime(p)) {
            printf("%ld ", p);
            found++;
        }
    }
    putchar('\n');
    return 0;
}
