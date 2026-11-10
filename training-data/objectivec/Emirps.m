#import <Foundation/Foundation.h>

static BOOL isPrime(NSInteger n) {
    if (n < 2) return NO;
    for (NSInteger i = 2; i * i <= n; i++) if (n % i == 0) return NO;
    return YES;
}

static NSInteger reverseDigits(NSInteger n) {
    NSInteger r = 0;
    for (; n > 0; n /= 10) r = r * 10 + n % 10;
    return r;
}

int main(void) {
    @autoreleasepool {
        NSMutableArray<NSNumber *> *out = [NSMutableArray array];
        for (NSInteger n = 2; out.count < 10; n++) {
            NSInteger r = reverseDigits(n);
            if (r != n && isPrime(n) && isPrime(r)) [out addObject:@(n)];
        }
        NSLog(@"%@", [out componentsJoinedByString:@" "]); // 13 17 31 37 71 73 79 97 107 113
    }
    return 0;
}
