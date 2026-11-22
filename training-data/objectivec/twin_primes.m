#import <Foundation/Foundation.h>

// Twin primes: pairs (p, p+2) both prime; print the lesser of each pair.
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
            if (isPrime(p) && isPrime(p + 2)) [out addObject:@(p)];
        NSLog(@"%@", [out componentsJoinedByString:@" "]);
    }
    return 0;
}
