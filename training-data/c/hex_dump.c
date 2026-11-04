#include <ctype.h>
#include <stdio.h>
#include <stddef.h>

void hex_dump(const unsigned char *p, size_t n) {
    for (size_t off = 0; off < n; off += 16) {
        printf("%08zx  ", off);
        for (size_t i = 0; i < 16; i++) {
            if (off + i < n) printf("%02x ", p[off + i]);
            else printf("   ");
        }
        printf(" |");
        for (size_t i = 0; i < 16 && off + i < n; i++)
            putchar(isprint(p[off + i]) ? p[off + i] : '.');
        printf("|\n");
    }
}

int main(void) {
    const unsigned char data[] = "Hello, hex dump!\n\x01\x02 tail";
    hex_dump(data, sizeof data - 1);
    return 0;
}
