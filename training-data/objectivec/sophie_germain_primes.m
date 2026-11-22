#import <Foundation/Foundation.h>

// Sophie Germain primes: p prime and 2p + 1 prime.
static BOOL isPrime(int n) {
    if (n < 2) return NO;
    for (int d = 2; d * d <= n; d++)
        if (n % d == 0) return NO;
    return YES;
}

int main(void) {
    @autoreleasepool {
        NSMutableArray<NSNumber *> *out = [NSMutableArray array];
        for (int p = 2; p < 100; p++)
            if (isPrime(p) && isPrime(2 * p + 1)) [out addObject:@(p)];
        NSLog(@"%@", [out componentsJoinedByString:@" "]);
    }
    return 0;
}
