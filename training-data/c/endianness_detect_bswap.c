#include <stdio.h>
#include <stdint.h>

static uint32_t bswap32(uint32_t x) {
    return (x >> 24) | ((x >> 8) & 0xff00) | ((x << 8) & 0xff0000) | (x << 24);
}

int main(void) {
    uint32_t one = 1;
    printf("%s endian\n", *(unsigned char *)&one ? "little" : "big");
    printf("0x%08x\n", bswap32(0x11223344));
    return 0;
}
