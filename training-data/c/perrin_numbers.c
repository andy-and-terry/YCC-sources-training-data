#include <stdio.h>

/* Perrin numbers: P(0) = 3, P(1) = 0, P(2) = 2, P(n) = P(n-2) + P(n-3) */
int main(void) {
    long p[15] = {3, 0, 2};
    for (int n = 3; n < 15; n++) p[n] = p[n - 2] + p[n - 3];
    for (int n = 0; n < 15; n++) printf("%ld ", p[n]);
    printf("\n");
    return 0;
}
