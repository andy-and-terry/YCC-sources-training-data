#include <stdio.h>
#include <stdint.h>

static uint8_t reverse_bits(uint8_t b) {
    uint8_t r = 0;
    for (int i = 0; i < 8; i++) {
        r = (uint8_t)((r << 1) | (b & 1));
        b >>= 1;
    }
    return r;
}

int main(void) {
    uint8_t vals[] = {0x01, 0x80, 0xA5, 0x0F};
    for (int i = 0; i < 4; i++)
        printf("0x%02X -> 0x%02X\n", vals[i], reverse_bits(vals[i]));
    return 0;
}
