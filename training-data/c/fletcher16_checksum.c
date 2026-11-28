#include <stdio.h>
#include <stdint.h>
#include <string.h>

uint16_t fletcher16(const uint8_t *data, size_t n) {
    uint16_t s1 = 0, s2 = 0;
    for (size_t i = 0; i < n; i++) {
        s1 = (s1 + data[i]) % 255;
        s2 = (s2 + s1) % 255;
    }
    return (uint16_t)((s2 << 8) | s1);
}

int main(void) {
    const char *s = "abcde";
    printf("%#x\n", fletcher16((const uint8_t *)s, strlen(s)));
    return 0;
}
