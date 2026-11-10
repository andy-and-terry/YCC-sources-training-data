#import <Foundation/Foundation.h>

static NSInteger tau(NSInteger n) {
    NSInteger c = 0;
    for (NSInteger d = 1; d <= n; d++) if (n % d == 0) c++;
    return c;
}

int main(void) {
    @autoreleasepool {
        NSMutableArray<NSNumber *> *out = [NSMutableArray array];
        for (NSInteger n = 1; n < 60; n++) if (n % tau(n) == 0) [out addObject:@(n)];
        NSLog(@"%@", [out componentsJoinedByString:@" "]); // 1 2 8 9 12 18 24 36 40 56
    }
    return 0;
}
