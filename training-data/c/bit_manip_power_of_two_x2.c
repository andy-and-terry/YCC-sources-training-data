#include <stdio.h>

static int is_pow2(unsigned x) { return x && !(x & (x - 1)); }

int main(void) {
    for (unsigned i = 1; i <= 17; i++) if (is_pow2(i)) printf("%u ", i);
    putchar('\n');
    return 0;
}
