#import <Foundation/Foundation.h>

static NSInteger fourSumCount(NSArray<NSNumber *> *a, NSArray<NSNumber *> *b,
                              NSArray<NSNumber *> *c, NSArray<NSNumber *> *d) {
    NSCountedSet *sums = [NSCountedSet set];
    for (NSNumber *x in a)
        for (NSNumber *y in b) [sums addObject:@(x.integerValue + y.integerValue)];
    NSInteger count = 0;
    for (NSNumber *x in c)
        for (NSNumber *y in d) count += [sums countForObject:@(-(x.integerValue + y.integerValue))];
    return count;
}

int main(void) {
    @autoreleasepool {
        NSLog(@"%ld", (long)fourSumCount(@[@1, @2], @[@-2, @-1], @[@-1, @2], @[@0, @2])); // 2
    }
    return 0;
}
