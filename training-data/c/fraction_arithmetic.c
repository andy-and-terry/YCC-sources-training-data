#include <stdio.h>
#include <stdlib.h>

typedef struct {
    long long num, den;
} frac;

static long long gcdll(long long a, long long b) {
    a = llabs(a);
    b = llabs(b);
    while (b) {
        long long t = a % b;
        a = b;
        b = t;
    }
    return a;
}

frac frac_make(long long n, long long d) {
    if (d < 0) {
        n = -n;
        d = -d;
    }
    long long g = gcdll(n, d);
    if (g > 1) {
        n /= g;
        d /= g;
    }
    return (frac){n, d};
}

frac frac_add(frac a, frac b) { return frac_make(a.num * b.den + b.num * a.den, a.den * b.den); }
frac frac_sub(frac a, frac b) { return frac_make(a.num * b.den - b.num * a.den, a.den * b.den); }
frac frac_mul(frac a, frac b) { return frac_make(a.num * b.num, a.den * b.den); }
frac frac_div(frac a, frac b) { return frac_make(a.num * b.den, a.den * b.num); }

void frac_print(const char *label, frac f) {
    if (f.den == 1) printf("%s%lld\n", label, f.num);
    else printf("%s%lld/%lld\n", label, f.num, f.den);
}

int main(void) {
    frac a = frac_make(1, 3), b = frac_make(1, 6);
    frac_print("a+b = ", frac_add(a, b));
    frac_print("a-b = ", frac_sub(a, b));
    frac_print("a*b = ", frac_mul(a, b));
    frac_print("a/b = ", frac_div(a, b));
    frac h = frac_make(0, 1);
    for (int k = 1; k <= 20; k++) h = frac_add(h, frac_make(1, k));
    frac_print("H(20) = ", h);
    return 0;
}
