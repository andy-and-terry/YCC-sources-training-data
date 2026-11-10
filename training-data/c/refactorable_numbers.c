#include <stdio.h>

static int tau(int n) {
    int c = 0;
    for (int d = 1; d <= n; d++) if (n % d == 0) c++;
    return c;
}

int main(void) {
    for (int n = 1; n < 60; n++) if (n % tau(n) == 0) printf("%d ", n);
    printf("\n"); /* 1 2 8 9 12 18 24 36 40 56 */
    return 0;
}
