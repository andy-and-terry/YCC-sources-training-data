#include <stdio.h>

/* 3n(n-1)+1 */
static long term(long n) {
    return ((3 * n) * (n - 1)) + 1;
}

int main(void) {
    for (long n = 1; n <= 15; n++)
        printf("%2ld -> %ld\n", n, term(n));
    return 0;
}
