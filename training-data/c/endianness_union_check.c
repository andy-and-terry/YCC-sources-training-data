#include <stdint.h>
#include <stdio.h>

typedef union {
    uint32_t word;
    uint8_t bytes[4];
} Word;

int main(void) {
    Word w;
    w.word = 0x01020304;

    printf("bytes in memory: %02x %02x %02x %02x\n",
           w.bytes[0], w.bytes[1], w.bytes[2], w.bytes[3]);
    printf("this machine is %s-endian\n", w.bytes[0] == 0x04 ? "little" : "big");

    uint32_t swapped = ((w.word & 0x000000FFu) << 24) |
                       ((w.word & 0x0000FF00u) << 8) |
                       ((w.word & 0x00FF0000u) >> 8) |
                       ((w.word & 0xFF000000u) >> 24);
    printf("byte-swapped: 0x%08x\n", swapped);
    return 0;
}
