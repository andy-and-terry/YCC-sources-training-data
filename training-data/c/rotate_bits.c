#include <stdio.h>
#include <stdint.h>

static uint32_t rotl32(uint32_t x, unsigned n) {
    n &= 31;
    return n ? (x << n) | (x >> (32 - n)) : x;
}

static uint32_t rotr32(uint32_t x, unsigned n) {
    n &= 31;
    return n ? (x >> n) | (x << (32 - n)) : x;
}

int main(void) {
    uint32_t v = 0x80000001u;
    printf("rotl 1: 0x%08X\n", rotl32(v, 1));
    printf("rotr 1: 0x%08X\n", rotr32(v, 1));
    printf("rotl 36: 0x%08X\n", rotl32(v, 36));
    return 0;
}
