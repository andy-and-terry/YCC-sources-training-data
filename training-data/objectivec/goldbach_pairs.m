// Goldbach partitions of 100; expect 6.
#import <Foundation/Foundation.h>

static BOOL isPrime(NSInteger n) {
    if (n < 2) return NO;
    for (NSInteger d = 2; d * d <= n; d++) if (n % d == 0) return NO;
    return YES;
}

int main(void) {
    @autoreleasepool {
        NSMutableArray *pairs = [NSMutableArray array];
        for (NSInteger p = 2; p <= 50; p++)
            if (isPrime(p) && isPrime(100 - p)) [pairs addObject:[NSString stringWithFormat:@"%ld+%ld", (long)p, (long)(100 - p)]];
        NSLog(@"%lu: %@", (unsigned long)pairs.count, pairs);
    }
    return 0;
}
