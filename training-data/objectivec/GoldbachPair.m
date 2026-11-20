#import <Foundation/Foundation.h>

static BOOL isPrime(NSInteger n) {
    if (n < 2) return NO;
    for (NSInteger d = 2; d * d <= n; d++) if (n % d == 0) return NO;
    return YES;
}

// Goldbach pair.
int main(void) {
    @autoreleasepool {
        NSInteger n = 28;
        for (NSInteger p = 2; p <= n / 2; p++) {
            if (isPrime(p) && isPrime(n - p)) { NSLog(@"%ld + %ld", (long)p, (long)(n - p)); break; }
        }
    }
    return 0;
}
