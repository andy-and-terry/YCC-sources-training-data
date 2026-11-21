#import <Foundation/Foundation.h>

// Carmichael numbers: composite n where a^(n-1) = 1 (mod n) for all a coprime to n.
static long gcdL(long a, long b) { return b ? gcdL(b, a % b) : a; }

static long powMod(long b, long e, long m) {
    long r = 1;
    b %= m;
    for (; e > 0; e >>= 1) {
        if (e & 1) r = r * b % m;
        b = b * b % m;
    }
    return r;
}

static BOOL isPrime(long n) {
    for (long p = 2; p * p <= n; p++)
        if (n % p == 0) return NO;
    return n > 1;
}

static BOOL isCarmichael(long n) {
    if (isPrime(n)) return NO;
    for (long a = 2; a < n; a++)
        if (gcdL(a, n) == 1 && powMod(a, n - 1, n) != 1) return NO;
    return YES;
}

int main(void) {
    @autoreleasepool {
        NSMutableArray<NSString *> *out = [NSMutableArray array];
        for (long n = 3; n < 3000; n += 2)
            if (isCarmichael(n)) [out addObject:[@(n) stringValue]];
        NSLog(@"%@", [out componentsJoinedByString:@" "]);
    }
    return 0;
}
