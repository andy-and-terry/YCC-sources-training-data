#include <stdio.h>

static long max_l(long a, long b) { return a > b ? a : b; }
static long min_l(long a, long b) { return a < b ? a : b; }

long max_product(const long *a, int n) {
    long best = a[0], hi = a[0], lo = a[0];
    for (int i = 1; i < n; i++) {
        long x = a[i];
        if (x < 0) { long t = hi; hi = lo; lo = t; }
        hi = max_l(x, hi * x);
        lo = min_l(x, lo * x);
        best = max_l(best, hi);
    }
    return best;
}

int main(void) {
    long a[] = {2, 3, -2, 4}, b[] = {-2, 3, -4};
    printf("%ld %ld\n", max_product(a, 4), max_product(b, 3));
    return 0;
}
