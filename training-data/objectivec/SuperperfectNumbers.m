#import <Foundation/Foundation.h>

static NSInteger sigma(NSInteger n) {
    NSInteger s = 0;
    for (NSInteger d = 1; d <= n; d++) if (n % d == 0) s += d;
    return s;
}

int main(void) {
    @autoreleasepool {
        NSMutableArray<NSNumber *> *out = [NSMutableArray array];
        for (NSInteger n = 1; n < 100; n++) if (sigma(sigma(n)) == 2 * n) [out addObject:@(n)];
        NSLog(@"%@", [out componentsJoinedByString:@" "]); // 2 4 16 64
    }
    return 0;
}
