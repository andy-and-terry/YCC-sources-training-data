#include <stdio.h>

static int is_pow2(unsigned long n) {
    return n && !(n & (n - 1));
}

int main(void) {
    unsigned long v[] = {0, 1, 2, 3, 64, 100, 1UL << 40};
    for (int i = 0; i < 7; i++)
        printf("%lu: %s\n", v[i], is_pow2(v[i]) ? "yes" : "no");
    return 0;
}
