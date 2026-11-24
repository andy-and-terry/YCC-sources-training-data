#include <cstdio>

/* Aliquot sequence: replace n by the sum of its proper divisors. */
static int aliquot_sum(int n) {
    int s = 0;
    for (int d = 1; d <= n / 2; d++)
        if (n % d == 0) s += d;
    return s;
}

int main(void) {
    int n = 12;
    printf("%d", n);
    for (int i = 0; i < 20 && n > 1; i++) {
        n = aliquot_sum(n);
        printf(" %d", n);
    }
    printf("\n");
    return 0;
}
