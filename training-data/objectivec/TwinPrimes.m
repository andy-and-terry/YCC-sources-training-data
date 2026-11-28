#import <Foundation/Foundation.h>

BOOL isPrime(int n) {
    if (n < 2) return NO;
    for (int d = 2; d * d <= n; d++) if (n % d == 0) return NO;
    return YES;
}

int main(void) {
    @autoreleasepool {
        for (int p = 3; p + 2 <= 50; p++) {
            if (isPrime(p) && isPrime(p + 2)) NSLog(@"(%d, %d)", p, p + 2);
        }
    }
    return 0;
}
