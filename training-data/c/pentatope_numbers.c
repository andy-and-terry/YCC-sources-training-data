#include <stdio.h>

/* n(n+1)(n+2)(n+3)/24 */
static long term(long n) {
    return (((n * (n + 1)) * (n + 2)) * (n + 3)) / 24;
}

int main(void) {
    for (long n = 1; n <= 15; n++)
        printf("%2ld -> %ld\n", n, term(n));
    return 0;
}
