#include <stdio.h>

/* Thue-Morse: t(n) is the parity of the number of 1 bits in n */
static int parity(unsigned n) {
    int p = 0;
    for (; n; n &= n - 1) p ^= 1; /* clear lowest set bit each step */
    return p;
}

int main(void) {
    for (unsigned n = 0; n < 32; n++) putchar('0' + parity(n));
    putchar('\n');
    return 0;
}
