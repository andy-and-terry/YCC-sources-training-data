#include <stdint.h>
#include <stdio.h>

union Word {
    uint32_t value;
    uint8_t bytes[4];
};

union FloatBits {
    float f;
    uint32_t bits;
};

int main(void) {
    union Word w = { .value = 0x01020304 };

    printf("bytes in memory:");
    for (int i = 0; i < 4; i++) printf(" %02x", w.bytes[i]);
    printf("\n");
    printf("this machine is %s-endian\n", w.bytes[0] == 0x04 ? "little" : "big");

    /* Swap byte order */
    uint32_t v = w.value;
    uint32_t swapped = (v >> 24) | ((v >> 8) & 0xFF00) | ((v << 8) & 0xFF0000) | (v << 24);
    printf("0x%08x -> 0x%08x\n", v, swapped);

    /* Inspect the IEEE-754 representation of a float */
    union FloatBits fb = { .f = -2.5f };
    printf("-2.5f bits: 0x%08x\n", fb.bits);
    printf("sign=%u exponent=%u mantissa=0x%06x\n",
           fb.bits >> 31, (fb.bits >> 23) & 0xFF, fb.bits & 0x7FFFFF);
    return 0;
}
