#import <Foundation/Foundation.h>

BOOL isPrime(int n) {
    if (n < 2) return NO;
    for (int i = 2; i * i <= n; i++) {
        if (n % i == 0) return NO;
    }
    return YES;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSMutableArray *primes = [NSMutableArray array];
        for (int n = 2; n <= 20; n++) {
            if (isPrime(n)) {
                [primes addObject:@(n)];
            }
        }
        NSLog(@"%@", primes);
    }
    return 0;
}
