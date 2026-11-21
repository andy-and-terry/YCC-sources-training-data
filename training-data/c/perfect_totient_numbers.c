#include <stdio.h>

/* Perfect totient numbers: sum of the iterated totient chain down to 1 equals n. */
static int gcd(int a, int b) { return b ? gcd(b, a % b) : a; }

static int phi(int n) {
    int c = 0;
    for (int k = 1; k <= n; k++)
        if (gcd(k, n) == 1) c++;
    return c;
}

static int is_perfect_totient(int n) {
    int total = 0;
    for (int m = n; m > 1;) {
        m = phi(m);
        total += m;
    }
    return total == n;
}

int main(void) {
    for (int n = 2; n < 200; n++)
        if (is_perfect_totient(n)) printf("%d ", n);
    printf("\n");
    return 0;
}
