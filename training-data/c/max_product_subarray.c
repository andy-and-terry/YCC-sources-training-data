#include <stdio.h>

long long max_product(const int *a, int n) {
    long long best = a[0], hi = a[0], lo = a[0];
    for (int i = 1; i < n; i++) {
        long long x = a[i];
        if (x < 0) {
            long long t = hi;
            hi = lo;
            lo = t;
        }
        hi = x > hi * x ? x : hi * x;
        lo = x < lo * x ? x : lo * x;
        if (hi > best) best = hi;
    }
    return best;
}

int main(void) {
    int a[] = {2, 3, -2, 4}, b[] = {-2, 0, -1}, c[] = {-2, 3, -4};
    printf("%lld %lld %lld\n", max_product(a, 4), max_product(b, 3), max_product(c, 3));
    return 0;
}
