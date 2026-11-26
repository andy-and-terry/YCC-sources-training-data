// Goldbach partitions of 100 as p + q, p <= q; expect 6.
#include <stdio.h>

static int is_prime(int n) {
    if (n < 2) return 0;
    for (int d = 2; d * d <= n; d++) if (n % d == 0) return 0;
    return 1;
}

int main(void) {
    int c = 0;
    for (int p = 2; p <= 50; p++) {
        if (is_prime(p) && is_prime(100 - p)) { printf("%d+%d\n", p, 100 - p); c++; }
    }
    printf("%d\n", c);
    return 0;
}
