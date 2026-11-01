#include <stdint.h>
#include <stdio.h>

union Bits { float f; uint32_t u; };

int main(void) {
    union Bits b = { .f = 1.0f };
    printf("0x%08x\n", b.u);
    b.u ^= 0x80000000u;
    printf("%f\n", b.f);
    return 0;
}
