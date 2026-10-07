#include <stdio.h>

long extended_gcd(long a, long b, long *x, long *y) {
    if (b == 0) {
        *x = 1;
        *y = 0;
        return a;
    }
    long x1, y1;
    long g = extended_gcd(b, a % b, &x1, &y1);
    *x = y1;
    *y = x1 - (a / b) * y1;
    return g;
}

long mod_inverse(long a, long m) {
    long x, y;
    extended_gcd(a, m, &x, &y);
    return ((x % m) + m) % m;
}

/* Solves x = rem[i] (mod mods[i]) for all i, assuming pairwise coprime moduli. */
long chinese_remainder(long rem[], long mods[], int n) {
    long product = 1;
    for (int i = 0; i < n; i++) product *= mods[i];

    long result = 0;
    for (int i = 0; i < n; i++) {
        long partial = product / mods[i];
        long inverse = mod_inverse(partial % mods[i], mods[i]);
        result = (result + rem[i] * partial % product * inverse) % product;
    }
    return (result + product) % product;
}

int main(void) {
    long rem[] = {2, 3, 2};
    long mods[] = {3, 5, 7};
    int n = 3;

    long x = chinese_remainder(rem, mods, n);
    printf("x = %ld\n", x);
    for (int i = 0; i < n; i++) {
        printf("x mod %ld = %ld (expected %ld)\n", mods[i], x % mods[i], rem[i]);
    }
    return 0;
}
