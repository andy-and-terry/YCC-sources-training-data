#import <Foundation/Foundation.h>

// Wilson's theorem primality test.
static BOOL wilson(long long n) {
    if (n < 2) return NO;
    long long f = 1;
    for (long long i = 2; i < n; i++) f = f * i % n;
    return f == n - 1;
}

int main(void) {
    @autoreleasepool {
        NSMutableArray *primes = [NSMutableArray array];
        for (int n = 2; n < 20; n++) if (wilson(n)) [primes addObject:@(n)];
        NSLog(@"%@", primes);
    }
    return 0;
}
