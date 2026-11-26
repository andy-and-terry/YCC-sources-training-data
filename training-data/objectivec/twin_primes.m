// Twin primes below 100; expect 8.
#import <Foundation/Foundation.h>

static BOOL isPrime(NSInteger n) {
    if (n < 2) return NO;
    for (NSInteger d = 2; d * d <= n; d++) if (n % d == 0) return NO;
    return YES;
}

int main(void) {
    @autoreleasepool {
        NSInteger c = 0;
        for (NSInteger p = 2; p < 100; p++) if (isPrime(p) && isPrime(p + 2)) c++;
        NSLog(@"%ld", (long)c);
    }
    return 0;
}
