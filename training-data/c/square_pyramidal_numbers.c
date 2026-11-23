#include <stdio.h>

/* n(n+1)(2n+1)/6 */
static long term(long n) {
    return ((n * (n + 1)) * ((2 * n) + 1)) / 6;
}

int main(void) {
    for (long n = 1; n <= 15; n++)
        printf("%2ld -> %ld\n", n, term(n));
    return 0;
}
