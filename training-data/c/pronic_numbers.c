/* Pronic numbers n(n+1) */
#include <stdio.h>

static long term(long n) { return n * (n + 1); }

int main(void) {
    for (long n = 0; n < 10; n++) printf("%ld ", term(n));
    putchar('\n');
    return 0;
}
