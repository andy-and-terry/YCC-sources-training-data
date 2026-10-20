#include <stdio.h>
#include <stdint.h>

static int popcount(uint32_t x) { int c = 0; while (x) { x &= x - 1; c++; } return c; }
static int is_pow2(uint32_t x) { return x && !(x & (x - 1)); }
static uint32_t reverse_bits(uint32_t x) {
    uint32_t r = 0;
    for (int i = 0; i < 32; i++) { r = (r << 1) | (x & 1); x >>= 1; }
    return r;
}

int main(void) {
    int a = 5, b = 9;
    a ^= b; b ^= a; a ^= b;
    printf("%d %d %d %d 0x%x\n", popcount(0xF0F0), is_pow2(64), a, b, reverse_bits(1));
    printf("lowest set: %u\n", 40u & -40u);
    return 0;
}
