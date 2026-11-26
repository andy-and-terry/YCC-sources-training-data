// Primorials up to 1e6, including 1; expect 8.
#import <Foundation/Foundation.h>

static BOOL isPrime(NSInteger n) {
    if (n < 2) return NO;
    for (NSInteger d = 2; d * d <= n; d++) if (n % d == 0) return NO;
    return YES;
}

int main(void) {
    @autoreleasepool {
        NSMutableArray *values = [NSMutableArray arrayWithObject:@1];
        long long acc = 1;
        for (NSInteger p = 2; ; p++) {
            if (!isPrime(p)) continue;
            acc *= p;
            if (acc > 1000000) break;
            [values addObject:@(acc)];
        }
        NSLog(@"%lu: %@", (unsigned long)values.count, values);
    }
    return 0;
}
