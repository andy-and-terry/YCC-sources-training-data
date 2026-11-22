#import <Foundation/Foundation.h>

// Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1.
int main(void) {
    @autoreleasepool {
        long long r = 0;
        NSMutableArray<NSNumber *> *out = [NSMutableArray array];
        for (int i = 0; i < 8; i++) {
            r = r * 10 + 1;
            [out addObject:@(r)];
        }
        NSLog(@"%@", [out componentsJoinedByString:@" "]);
    }
    return 0;
}
