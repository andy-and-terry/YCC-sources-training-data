#include <stdint.h>
#include <stdio.h>

static size_t varint(uint64_t n, uint8_t *out) {
    size_t i = 0;
    while (n >= 0x80) {
        out[i++] = (uint8_t)(n & 0x7F) | 0x80;
        n >>= 7;
    }
    out[i++] = (uint8_t)n;
    return i;
}

int main(void) {
    uint8_t buf[10];
    size_t len = varint(300, buf);
    for (size_t i = 0; i < len; i++) printf("%02x ", buf[i]);
    printf("\n");
    return 0;
}
