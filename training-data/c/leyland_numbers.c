#include <stdio.h>

/* Leyland numbers: x^y + y^x for x >= y >= 2. */
static long ipow(long b, int e) {
    long r = 1;
    while (e-- > 0) r *= b;
    return r;
}

int main(void) {
    for (int x = 2; x <= 4; x++)
        for (int y = 2; y <= x; y++)
            printf("%ld ", ipow(x, y) + ipow(y, x));
    printf("\n");
    return 0;
}
