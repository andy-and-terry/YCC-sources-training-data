#include <stdint.h>
#include <stdio.h>
#include <string.h>

static uint32_t table[256];

static void init(void) {
    for (uint32_t i = 0; i < 256; i++) {
        uint32_t c = i;
        for (int k = 0; k < 8; k++) c = (c & 1) ? 0xEDB88320u ^ (c >> 1) : c >> 1;
        table[i] = c;
    }
}

static uint32_t crc32(const void *p, size_t n) {
    const unsigned char *d = p;
    uint32_t c = 0xFFFFFFFFu;
    while (n--) c = table[(c ^ *d++) & 0xff] ^ (c >> 8);
    return ~c;
}

int main(void) {
    init();
    printf("%08x\n", crc32("123456789", 9));
    return 0;
}
