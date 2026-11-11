/* Tetrahedral numbers n(n+1)(n+2)/6 */
#include <stdio.h>

static long term(long n) { return ((n * (n + 1)) * (n + 2))/6; }

int main(void) {
    for (long n = 0; n < 10; n++) printf("%ld ", term(n));
    putchar('\n');
    return 0;
}
