#include <stdint.h>
#include <stdio.h>
#include <string.h>

static uint8_t crc8(const uint8_t *d, size_t n) {
    uint8_t crc = 0;
    while (n--) {
        crc ^= *d++;
        for (int i = 0; i < 8; i++) crc = (crc & 0x80) ? (uint8_t)((crc << 1) ^ 0x07) : (uint8_t)(crc << 1);
    }
    return crc;
}

int main(void) {
    printf("%02x\n", crc8((const uint8_t *)"123456789", 9));
    return 0;
}
