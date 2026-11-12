#include <stdio.h>
#include <stdint.h>
union fbits { float f; uint32_t u; };
int main(void) {
    union fbits v = { .f = 1.0f };
    printf("0x%08X\n", v.u);
    v.u ^= 0x80000000u;
    printf("%f\n", v.f);
    return 0;
}
