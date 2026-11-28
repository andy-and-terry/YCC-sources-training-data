#include <stdint.h>
#include <stdio.h>

static uint8_t reverse_bits(uint8_t v) {
    v = (uint8_t)((v & 0xF0) >> 4 | (v & 0x0F) << 4);
    v = (uint8_t)((v & 0xCC) >> 2 | (v & 0x33) << 2);
    v = (uint8_t)((v & 0xAA) >> 1 | (v & 0x55) << 1);
    return v;
}

int main(void) {
    uint8_t inputs[] = {1, 6, 13, 128};
    for (int i = 0; i < 4; i++)
        printf("%u %u\n", inputs[i], reverse_bits(inputs[i])); /* 128 96 176 1 */
    return 0;
}
