#import <Foundation/Foundation.h>

static BOOL isPrime(NSInteger n) {
    if (n < 2) return NO;
    for (NSInteger i = 2; i * i <= n; i++) if (n % i == 0) return NO;
    return YES;
}

static NSInteger reverseNumber(NSInteger n) {
    NSInteger r = 0;
    for (; n > 0; n /= 10) r = r * 10 + n % 10;
    return r;
}

int main(void) {
    @autoreleasepool {
        NSMutableArray *result = [NSMutableArray array];
        for (NSInteger p = 2; p < 200; p++) {
            NSInteger r = reverseNumber(p);
            if (r != p && isPrime(p) && isPrime(r)) [result addObject:@(p)];
        }
        NSLog(@"%@", [result componentsJoinedByString:@" "]); // 13 17 31 37 71 73 79 97 107 ...
    }
    return 0;
}
