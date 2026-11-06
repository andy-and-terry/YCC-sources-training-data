// Fermat primality test; Carmichael number 561 fools it.
#import <Foundation/Foundation.h>

static unsigned long long powmod(unsigned long long b, unsigned long long e, unsigned long long m) {
    unsigned long long r = 1;
    b %= m;
    while (e > 0) {
        if (e & 1) r = r * b % m;
        b = b * b % m;
        e >>= 1;
    }
    return r;
}

static BOOL probablyPrime(unsigned long long n) {
    return n > 2 && powmod(2, n - 1, n) == 1;
}

int main(void) {
    @autoreleasepool {
        for (NSNumber *n in @[@97, @91, @561])
            NSLog(@"%@ %@", n, probablyPrime(n.unsignedLongLongValue) ? @"true" : @"false");
    }
    return 0;
}
