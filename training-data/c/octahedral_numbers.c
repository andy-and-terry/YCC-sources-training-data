#include <stdio.h>

/* n(2n^2+1)/3 */
static long term(long n) {
    return (n * (((2 * n) * n) + 1)) / 3;
}

int main(void) {
    for (long n = 1; n <= 15; n++)
        printf("%2ld -> %ld\n", n, term(n));
    return 0;
}
