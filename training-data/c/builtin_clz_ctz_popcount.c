#include <stdio.h>

int main(void) {
    unsigned x = 0x00F0u;
    printf("clz(%#x)      = %d\n", x, __builtin_clz(x));
    printf("ctz(%#x)      = %d\n", x, __builtin_ctz(x));
    printf("popcount(%#x) = %d\n", x, __builtin_popcount(x));
    printf("parity(%#x)   = %d\n", x, __builtin_parity(x));
    unsigned floor_log2 = 31 - __builtin_clz(1000u);
    printf("floor(log2(1000)) = %u\n", floor_log2);
    return 0;
}
