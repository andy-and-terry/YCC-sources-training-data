// Emirps below 200; expect 15.
#import <Foundation/Foundation.h>

static BOOL isPrime(NSInteger n) {
    if (n < 2) return NO;
    for (NSInteger d = 2; d * d <= n; d++) if (n % d == 0) return NO;
    return YES;
}

static NSInteger rev(NSInteger n) {
    NSInteger r = 0;
    while (n > 0) { r = r * 10 + n % 10; n /= 10; }
    return r;
}

int main(void) {
    @autoreleasepool {
        NSInteger c = 0;
        for (NSInteger n = 2; n < 200; n++) {
            NSInteger r = rev(n);
            if (r != n && isPrime(n) && isPrime(r)) c++;
        }
        NSLog(@"%ld", (long)c);
    }
    return 0;
}
