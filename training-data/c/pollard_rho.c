#include <stdio.h>

static unsigned long gcd(unsigned long a, unsigned long b) {
    while (b) { unsigned long t = a % b; a = b; b = t; }
    return a;
}

static unsigned long rho(unsigned long n) {
    if (n % 2 == 0) return 2;
    unsigned long x = 2, y = 2, d = 1;
    while (d == 1) {
        x = (x * x + 1) % n;
        y = (y * y + 1) % n;
        y = (y * y + 1) % n;
        d = gcd(x > y ? x - y : y - x, n);
    }
    return d;
}

int main(void) {
    unsigned long n = 8051, f = rho(n);
    printf("%lu = %lu * %lu\n", n, f, n / f);
    return 0;
}
