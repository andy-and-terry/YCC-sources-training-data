// Squarefree numbers up to 100; expect 61.
#include <stdio.h>

static int squarefree(int n) {
    for (int d = 2; d * d <= n; d++) if (n % (d * d) == 0) return 0;
    return 1;
}

int main(void) {
    int c = 0;
    for (int n = 1; n <= 100; n++) c += squarefree(n);
    printf("%d\n", c);
    return 0;
}
