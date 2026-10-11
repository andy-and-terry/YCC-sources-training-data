#include <stdio.h>
#include <string.h>
#include <math.h>

/* Primes in [lo, hi] using base primes up to sqrt(hi). */
int main(void) {
    int lo = 100, hi = 150;
    char mark[64];
    memset(mark, 1, sizeof mark);
    for (int p = 2; p * p <= hi; p++)
        for (int m = ((lo + p - 1) / p) * p; m <= hi; m += p)
            if (m != p) mark[m - lo] = 0;
    for (int i = lo; i <= hi; i++)
        if (mark[i - lo] && i > 1) printf("%d ", i);
    putchar('\n');
    return 0;
}
