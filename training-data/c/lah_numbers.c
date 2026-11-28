#include <stdio.h>

static unsigned long lah(int n, int k) {
    unsigned long c = 1, f = 1;
    for (int i = 0; i < k - 1; i++) c = c * (n - 1 - i) / (i + 1);
    for (int i = k + 1; i <= n; i++) f *= i;
    return c * f;
}

int main(void) {
    for (int n = 1; n <= 5; n++) {
        for (int k = 1; k <= n; k++) printf("%lu ", lah(n, k));
        putchar('\n');
    }
    return 0;
}
