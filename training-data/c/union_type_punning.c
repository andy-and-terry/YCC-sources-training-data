#include <stdint.h>
#include <stdio.h>

typedef union {
    float f;
    uint32_t bits;
} FloatBits;

int main(void) {
    FloatBits fb = { .f = -2.5f };
    uint32_t sign = fb.bits >> 31;
    uint32_t exponent = (fb.bits >> 23) & 0xFF;
    uint32_t mantissa = fb.bits & 0x7FFFFF;
    printf("bits=0x%08X sign=%u exponent=%u (unbiased %d) mantissa=0x%X\n",
           fb.bits, sign, exponent, (int)exponent - 127, mantissa);
    return 0;
}
