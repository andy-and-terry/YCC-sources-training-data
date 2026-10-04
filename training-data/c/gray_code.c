#include <stdio.h>

static unsigned to_gray(unsigned n) { return n ^ (n >> 1); }

static unsigned from_gray(unsigned g) {
    unsigned n = 0;
    for (; g; g >>= 1) n ^= g;
    return n;
}

static void print_bits(unsigned v, int width) {
    for (int i = width - 1; i >= 0; i--) putchar((v >> i) & 1 ? '1' : '0');
}

int main(void) {
    for (unsigned i = 0; i < 8; i++) {
        unsigned g = to_gray(i);
        printf("%u -> ", i);
        print_bits(g, 3);
        printf(" -> %u\n", from_gray(g));
    }
    return 0;
}
