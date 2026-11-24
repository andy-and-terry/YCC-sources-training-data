#include <cstdio>

/* Moser-de Bruijn sequence: binary digits of n read in base 4. */
static unsigned moser(unsigned n) {
    unsigned result = 0, place = 1;
    for (; n; n >>= 1, place *= 4)
        if (n & 1) result += place;
    return result;
}

int main(void) {
    for (unsigned n = 0; n < 12; n++) printf("%u ", moser(n));
    printf("\n");
    return 0;
}
