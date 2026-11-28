#include <stdio.h>

/* sets are bitmasks over small non-negative integers */
double jaccard(unsigned a, unsigned b) {
    unsigned u = a | b, i = a & b;
    if (!u) return 1.0;
    return (double)__builtin_popcount(i) / __builtin_popcount(u);
}

int main(void) {
    unsigned a = (1u << 1) | (1u << 2) | (1u << 3) | (1u << 4);
    unsigned b = (1u << 3) | (1u << 4) | (1u << 5);
    printf("%.2f\n", jaccard(a, b));
    return 0;
}
