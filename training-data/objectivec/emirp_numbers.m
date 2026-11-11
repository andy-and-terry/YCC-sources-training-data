// Emirps: primes whose digit reversal is a different prime.
#import <Foundation/Foundation.h>

static BOOL isPrime(int n) {
    if (n < 2) return NO;
    for (int i = 2; i * i <= n; i++) if (n % i == 0) return NO;
    return YES;
}

static int reverseDigits(int n) {
    int r = 0;
    for (; n > 0; n /= 10) r = r * 10 + n % 10;
    return r;
}

int main(void) {
    @autoreleasepool {
        NSMutableArray *emirps = [NSMutableArray array];
        for (int n = 2; n < 100; n++) {
            int r = reverseDigits(n);
            if (r != n && isPrime(n) && isPrime(r)) [emirps addObject:@(n)];
        }
        NSLog(@"%@", [emirps componentsJoinedByString:@" "]);
    }
    return 0;
}
