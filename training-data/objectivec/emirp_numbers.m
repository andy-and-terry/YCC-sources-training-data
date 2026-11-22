#import <Foundation/Foundation.h>

// Emirps: primes whose digit reversal is a different prime.
static BOOL isPrime(int n) {
    if (n < 2) return NO;
    for (int d = 2; d * d <= n; d++)
        if (n % d == 0) return NO;
    return YES;
}

static int reverseNum(int n) {
    int r = 0;
    for (; n > 0; n /= 10) r = r * 10 + n % 10;
    return r;
}

int main(void) {
    @autoreleasepool {
        NSMutableArray<NSNumber *> *out = [NSMutableArray array];
        for (int n = 2; n < 200; n++) {
            int r = reverseNum(n);
            if (r != n && isPrime(n) && isPrime(r)) [out addObject:@(n)];
        }
        NSLog(@"%@", [out componentsJoinedByString:@" "]);
    }
    return 0;
}
