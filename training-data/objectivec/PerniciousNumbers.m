#import <Foundation/Foundation.h>

static BOOL isPrime(int n) {
    if (n < 2) return NO;
    for (int d = 2; d * d <= n; d++)
        if (n % d == 0) return NO;
    return YES;
}

// Pernicious numbers: the popcount is prime.
int main(void) {
    @autoreleasepool {
        NSMutableArray<NSNumber *> *out = [NSMutableArray array];
        for (int n = 1; n <= 20; n++)
            if (isPrime(__builtin_popcount(n))) [out addObject:@(n)];
        NSLog(@"%@", [out componentsJoinedByString:@" "]);
    }
    return 0;
}
