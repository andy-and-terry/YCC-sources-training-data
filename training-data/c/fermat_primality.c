/* Fermat primality test; Carmichael number 561 fools it. */
#include <stdio.h>

static unsigned long powmod(unsigned long b, unsigned long e, unsigned long m) {
    unsigned long r = 1;
    b %= m;
    while (e) {
        if (e & 1) r = r * b % m;
        b = b * b % m;
        e >>= 1;
    }
    return r;
}

static int fermat_probably_prime(unsigned long n) {
    return n > 2 && powmod(2, n - 1, n) == 1;
}

int main(void) {
    unsigned long tests[] = {97, 91, 561};
    for (int i = 0; i < 3; i++)
        printf("%lu %s\n", tests[i], fermat_probably_prime(tests[i]) ? "true" : "false");
    return 0;
}
