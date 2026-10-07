#include <stdio.h>

/* Returns gcd(a, b) and sets *x, *y such that a*x + b*y = gcd(a, b). */
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

/* Modular inverse of a mod m, assuming gcd(a, m) == 1. */
long mod_inverse(long a, long m) {
    long x, y;
    extended_gcd(a, m, &x, &y);
    return ((x % m) + m) % m;
}

int main(void) {
    long a = 240, b = 46;
    long x, y;
    long g = extended_gcd(a, b, &x, &y);

    printf("gcd(%ld, %ld) = %ld\n", a, b, g);
    printf("%ld*(%ld) + %ld*(%ld) = %ld\n", a, x, b, y, a * x + b * y);

    long inv = mod_inverse(3, 11);
    printf("3^-1 mod 11 = %ld (check: %ld)\n", inv, (3 * inv) % 11);

    return 0;
}
