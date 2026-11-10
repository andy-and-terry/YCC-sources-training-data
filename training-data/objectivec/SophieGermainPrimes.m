#import <Foundation/Foundation.h>

static BOOL isPrime(NSInteger n) {
    if (n < 2) return NO;
    for (NSInteger i = 2; i * i <= n; i++) if (n % i == 0) return NO;
    return YES;
}

int main(void) {
    @autoreleasepool {
        NSMutableArray<NSNumber *> *found = [NSMutableArray array];
        for (NSInteger p = 2; found.count < 10; p++) {
            if (isPrime(p) && isPrime(2 * p + 1)) [found addObject:@(p)];
        }
        NSLog(@"%@", [found componentsJoinedByString:@" "]); // 2 3 5 11 23 29 41 53 83 89
    }
    return 0;
}
