// Primorials up to 1e6, including 1; expect 8.
#include <stdio.h>

static int is_prime(int n) {
    if (n < 2) return 0;
    for (int d = 2; d * d <= n; d++) if (n % d == 0) return 0;
    return 1;
}

int main(void) {
    long acc = 1;
    int count = 1;
    printf("1");
    for (int p = 2; ; p++) {
        if (!is_prime(p)) continue;
        acc *= p;
        if (acc > 1000000) break;
        printf(" %ld", acc);
        count++;
    }
    printf("\n%d\n", count);
    return 0;
}
