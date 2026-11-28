#include <stdio.h>

static int is_automorphic(long n) {
    long sq = n * n, mod = 1;
    for (long m = n; m > 0; m /= 10) mod *= 10;
    return sq % mod == n;
}

int main(void) {
    for (long n = 1; n < 1000; n++)
        if (is_automorphic(n)) printf("%ld ", n);
    printf("\n"); /* 1 5 6 25 76 376 625 */
    return 0;
}
