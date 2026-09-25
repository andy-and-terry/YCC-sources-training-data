#include <stdio.h>

unsigned to_gray(unsigned n) { return n ^ (n >> 1); }

unsigned from_gray(unsigned g) {
    unsigned b = 0;
    for (; g; g >>= 1) b ^= g;
    return b;
}

static void print_bits(unsigned v, int bits) {
    for (int i = bits - 1; i >= 0; i--) putchar((v >> i) & 1 ? '1' : '0');
}

int main(void) {
    for (unsigned i = 0; i < 16; i++) {
        unsigned g = to_gray(i);
        printf("%2u ", i);
        print_bits(g, 4);
        printf(" %2u%s\n", from_gray(g), i && __builtin_popcount(g ^ to_gray(i - 1)) != 1 ? " !!" : "");
    }
    return 0;
}
