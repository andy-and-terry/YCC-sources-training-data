#include <stdio.h>

static int is_prime(int n) {
    if (n < 2) return 0;
    for (int d = 2; d * d <= n; d++)
        if (n % d == 0) return 0;
    return 1;
}

int main(void) {
    int n = 28;
    for (int p = 2; p <= n / 2; p++)
        if (is_prime(p) && is_prime(n - p)) printf("%d + %d\n", p, n - p);
    return 0;
}
