#import <Foundation/Foundation.h>

static unsigned long gcdUL(unsigned long a, unsigned long b) {
    while (b) { unsigned long t = a % b; a = b; b = t; }
    return a;
}

static unsigned long rho(unsigned long n) {
    if (n % 2 == 0) return 2;
    unsigned long (^f)(unsigned long) = ^unsigned long(unsigned long v) { return (v * v + 1) % n; };
    unsigned long x = 2, y = 2, d = 1;
    while (d == 1) {
        x = f(x); y = f(f(y));
        d = gcdUL(x > y ? x - y : y - x, n);
    }
    return d;
}

int main(void) {
    @autoreleasepool {
        unsigned long n = 8051, p = rho(n);
        NSLog(@"%lu = %lu * %lu", n, p, n / p);
    }
    return 0;
}
