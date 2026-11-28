#import <Foundation/Foundation.h>

static NSArray<NSArray<NSNumber *> *> *insertInterval(NSArray<NSArray<NSNumber *> *> *iv, NSArray<NSNumber *> *nw) {
    NSMutableArray *out = [NSMutableArray array];
    NSInteger lo = nw[0].integerValue, hi = nw[1].integerValue;
    NSUInteger i = 0;
    while (i < iv.count && [iv[i][1] integerValue] < lo) [out addObject:iv[i++]];
    while (i < iv.count && [iv[i][0] integerValue] <= hi) {
        lo = MIN(lo, [iv[i][0] integerValue]);
        hi = MAX(hi, [iv[i][1] integerValue]);
        i++;
    }
    [out addObject:@[@(lo), @(hi)]];
    while (i < iv.count) [out addObject:iv[i++]];
    return out;
}

int main(void) {
    @autoreleasepool {
        NSLog(@"%@", insertInterval(@[@[@1, @3], @[@6, @9]], @[@2, @5])); // (1,5) (6,9)
    }
    return 0;
}
