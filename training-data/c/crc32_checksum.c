#include <stdint.h>
#include <stdio.h>
#include <string.h>

static uint32_t table[256];

static void init_table(void) {
    for (uint32_t i = 0; i < 256; i++) {
        uint32_t c = i;
        for (int k = 0; k < 8; k++) c = (c & 1) ? 0xEDB88320u ^ (c >> 1) : c >> 1;
        table[i] = c;
    }
}

static uint32_t crc32(const void *data, size_t n) {
    const unsigned char *p = data;
    uint32_t crc = 0xFFFFFFFFu;
    while (n--) crc = table[(crc ^ *p++) & 0xFF] ^ (crc >> 8);
    return crc ^ 0xFFFFFFFFu;
}

int main(void) {
    init_table();
    const char *s = "123456789";
    printf("crc32(\"%s\") = %08X\n", s, crc32(s, strlen(s)));  /* CBF43926 */
    return 0;
}
