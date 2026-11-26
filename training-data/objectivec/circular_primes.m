// Circular primes below 100; expect 13.
#import <Foundation/Foundation.h>

static BOOL isPrime(NSInteger n) {
    if (n < 2) return NO;
    for (NSInteger d = 2; d * d <= n; d++) if (n % d == 0) return NO;
    return YES;
}

static BOOL circular(NSInteger n) {
    NSString *s = [NSString stringWithFormat:@"%ld", (long)n];
    for (NSUInteger i = 0; i < s.length; i++) {
        NSString *r = [[s substringFromIndex:i] stringByAppendingString:[s substringToIndex:i]];
        if (!isPrime([r integerValue])) return NO;
    }
    return YES;
}

int main(void) {
    @autoreleasepool {
        NSInteger c = 0;
        for (NSInteger n = 2; n < 100; n++) if (circular(n)) c++;
        NSLog(@"%ld", (long)c);
    }
    return 0;
}
