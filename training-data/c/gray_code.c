#include <stdio.h>

static unsigned to_gray(unsigned n) { return n ^ (n >> 1); }

static unsigned from_gray(unsigned g) {
    unsigned n = 0;
    for (; g; g >>= 1) n ^= g;
    return n;
}

int main(void) {
    for (unsigned i = 0; i < 8; i++) {
        unsigned g = to_gray(i);
        printf("%u -> %u%u%u -> %u\n", i, (g >> 2) & 1, (g >> 1) & 1, g & 1, from_gray(g));
    }
    return 0;
}
