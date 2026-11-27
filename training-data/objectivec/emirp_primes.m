#import <Foundation/Foundation.h>

static BOOL isPrime(NSInteger n) {
    if (n < 2) return NO;
    for (NSInteger i = 2; i * i <= n; i++) if (n % i == 0) return NO;
    return YES;
}

static NSInteger rev(NSInteger n) {
    NSInteger r = 0;
    for (; n > 0; n /= 10) r = r * 10 + n % 10;
    return r;
}

int main(void) {
    @autoreleasepool {
        NSMutableArray *out = [NSMutableArray array];
        for (NSInteger p = 2; p < 100; p++)
            if (isPrime(p) && rev(p) != p && isPrime(rev(p))) [out addObject:@(p)];
        NSLog(@"%@", [out componentsJoinedByString:@" "]);
    }
    return 0;
}
