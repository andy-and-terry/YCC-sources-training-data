#import <Foundation/Foundation.h>

BOOL isPrime(int n) {
    if (n < 2) return NO;
    for (int d = 2; d * d <= n; d++) if (n % d == 0) return NO;
    return YES;
}

int main(void) {
    @autoreleasepool {
        int n = 28;
        for (int p = 2; p <= n / 2; p++) {
            if (isPrime(p) && isPrime(n - p)) NSLog(@"%d + %d", p, n - p);
        }
    }
    return 0;
}
