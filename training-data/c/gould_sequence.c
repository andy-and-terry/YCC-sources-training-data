#include <stdio.h>

static int gould(unsigned n) {
    return 1 << __builtin_popcount(n);
}

int main(void) {
    for (unsigned n = 0; n < 16; n++) printf("%d ", gould(n));
    putchar('\n');
    return 0;
}
