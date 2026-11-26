// Deficient numbers below 100; expect 76.
#include <stdio.h>

static int proper_sum(int n) {
    int t = 0;
    for (int d = 1; d < n; d++) if (n % d == 0) t += d;
    return t;
}

int main(void) {
    int c = 0;
    for (int n = 1; n < 100; n++) if (proper_sum(n) < n) c++;
    printf("%d\n", c);
    return 0;
}
