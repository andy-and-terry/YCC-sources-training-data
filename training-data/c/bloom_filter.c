#include <stdio.h>
#include <string.h>

#define BIT_ARRAY_SIZE 64

unsigned char bits[BIT_ARRAY_SIZE / 8];

void set_bit(unsigned int index) {
    bits[index / 8] |= (1 << (index % 8));
}

int get_bit(unsigned int index) {
    return (bits[index / 8] >> (index % 8)) & 1;
}

unsigned int hash1(const char *s) {
    unsigned int h = 5381;
    while (*s) h = h * 33 + (unsigned char)(*s++);
    return h % BIT_ARRAY_SIZE;
}

unsigned int hash2(const char *s) {
    unsigned int h = 0;
    while (*s) h = h * 31 + (unsigned char)(*s++);
    return h % BIT_ARRAY_SIZE;
}

unsigned int hash3(const char *s) {
    unsigned int h = 7;
    while (*s) h = (h << 3) ^ (unsigned char)(*s++);
    return h % BIT_ARRAY_SIZE;
}

void bloom_add(const char *s) {
    set_bit(hash1(s));
    set_bit(hash2(s));
    set_bit(hash3(s));
}

int bloom_might_contain(const char *s) {
    return get_bit(hash1(s)) && get_bit(hash2(s)) && get_bit(hash3(s));
}

int main(void) {
    memset(bits, 0, sizeof(bits));

    const char *stored[] = {"apple", "banana", "cherry"};
    for (int i = 0; i < 3; i++) bloom_add(stored[i]);

    const char *queries[] = {"apple", "banana", "cherry", "durian", "kiwi"};
    for (int i = 0; i < 5; i++) {
        printf("%s -> %s\n", queries[i], bloom_might_contain(queries[i]) ? "maybe present" : "definitely absent");
    }
    return 0;
}
