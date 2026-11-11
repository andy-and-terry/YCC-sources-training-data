/* Centered square numbers 2n(n+1)+1 */
#include <stdio.h>

static long term(long n) { return ((2 * n) * (n + 1)) + 1; }

int main(void) {
    for (long n = 0; n < 10; n++) printf("%ld ", term(n));
    putchar('\n');
    return 0;
}
