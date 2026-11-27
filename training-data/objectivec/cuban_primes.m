#import <Foundation/Foundation.h>

static BOOL isPrime(long n) {
    if (n < 2) return NO;
    for (long i = 2; i * i <= n; i++) if (n % i == 0) return NO;
    return YES;
}

int main(void) {
    @autoreleasepool {
        NSMutableArray *out = [NSMutableArray array];
        for (long y = 1; out.count < 8; y++) {
            long p = 3 * y * y + 3 * y + 1;
            if (isPrime(p)) [out addObject:@(p)];
        }
        NSLog(@"%@", out);
    }
    return 0;
}
