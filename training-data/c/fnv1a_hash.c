#include <stdio.h>
#include <stdint.h>

static uint32_t fnv1a(const char *s) {
    uint32_t h = 2166136261u;
    while (*s) {
        h ^= (uint8_t)*s++;
        h *= 16777619u;
    }
    return h;
}

int main(void) {
    const char *words[] = {"", "a", "hello", "world"};
    for (int i = 0; i < 4; i++)
        printf("fnv1a(\"%s\") = 0x%08X\n", words[i], fnv1a(words[i]));
    return 0;
}
