#import <Foundation/Foundation.h>

static NSArray<NSNumber *> *factorize(NSUInteger n) {
    NSMutableArray<NSNumber *> *factors = [NSMutableArray array];
    for (NSUInteger p = 2; p * p <= n; p++) {
        while (n % p == 0) {
            [factors addObject:@(p)];
            n /= p;
        }
    }
    if (n > 1) {
        [factors addObject:@(n)];
    }
    return factors;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"360 = %@", [factorize(360) componentsJoinedByString:@" x "]);
        NSLog(@"97 = %@", [factorize(97) componentsJoinedByString:@" x "]);
    }
    return 0;
}
