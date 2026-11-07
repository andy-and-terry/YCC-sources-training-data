#import <Foundation/Foundation.h>

static NSInteger maxArea(NSArray<NSNumber *> *h) {
    NSInteger lo = 0, hi = (NSInteger)h.count - 1, best = 0;
    while (lo < hi) {
        NSInteger a = h[lo].integerValue, b = h[hi].integerValue;
        best = MAX(best, MIN(a, b) * (hi - lo));
        if (a < b) lo++; else hi--;
    }
    return best;
}

int main(void) {
    @autoreleasepool {
        NSLog(@"%ld", (long)maxArea(@[@1, @8, @6, @2, @5, @4, @8, @3, @7])); // 49
    }
    return 0;
}
