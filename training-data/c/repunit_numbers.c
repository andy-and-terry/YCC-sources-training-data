#include <stdio.h>

/* Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1. */
int main(void) {
    long r = 0;
    for (int i = 0; i < 8; i++) {
        r = r * 10 + 1;
        printf("%ld ", r);
    }
    printf("\n");
    return 0;
}
