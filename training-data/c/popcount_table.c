/* Population count (number of set bits) for 0..15 */
#include <stdio.h>

static int bits(unsigned n) {
    int c = 0;
    for (; n; n &= n - 1) c++;   /* Kernighan: clear lowest set bit */
    return c;
}

int main(void) {
    for (unsigned n = 0; n < 16; n++) printf("%d ", bits(n));
    putchar('\n');
    return 0;
}
