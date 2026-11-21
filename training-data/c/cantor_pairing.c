#include <math.h>
#include <stdio.h>

/* Cantor pairing function and its inverse. */
static long pair(long x, long y) { return (x + y) * (x + y + 1) / 2 + y; }

static void unpair(long z, long *x, long *y) {
    long w = (long)((sqrt(8.0 * z + 1) - 1) / 2);
    *y = z - w * (w + 1) / 2;
    *x = w - *y;
}

int main(void) {
    long x, y;
    printf("%ld\n", pair(3, 4));
    unpair(32, &x, &y);
    printf("%ld %ld\n", x, y);
    return 0;
}
