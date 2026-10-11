#include <stdio.h>
#include <stdint.h>
#include <string.h>

static uint32_t adler32(const unsigned char *data, size_t len) {
    uint32_t a = 1, b = 0;
    for (size_t i = 0; i < len; i++) {
        a = (a + data[i]) % 65521;
        b = (b + a) % 65521;
    }
    return (b << 16) | a;
}

int main(void) {
    const char *s = "Wikipedia";
    printf("adler32 = 0x%08X\n", adler32((const unsigned char *)s, strlen(s)));
    return 0;
}
