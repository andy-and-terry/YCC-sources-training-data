#include <stdio.h>
#include <string.h>

static int hamming_bits(unsigned a, unsigned b) {
    unsigned x = a ^ b;
    int count = 0;
    while (x) {
        x &= x - 1; /* clear lowest set bit */
        count++;
    }
    return count;
}

static int hamming_str(const char *a, const char *b) {
    if (strlen(a) != strlen(b)) return -1;
    int d = 0;
    for (; *a; a++, b++)
        if (*a != *b) d++;
    return d;
}

int main(void) {
    printf("bits(1, 4) = %d\n", hamming_bits(1, 4));
    printf("bits(255, 0) = %d\n", hamming_bits(255, 0));
    printf("str = %d\n", hamming_str("karolin", "kathrin"));
    return 0;
}
