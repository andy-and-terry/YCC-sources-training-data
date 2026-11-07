#import <Foundation/Foundation.h>

static NSInteger equilibriumIndex(NSArray<NSNumber *> *nums) {
    NSInteger total = 0, left = 0;
    for (NSNumber *n in nums) total += n.integerValue;
    for (NSUInteger i = 0; i < nums.count; i++) {
        NSInteger v = nums[i].integerValue;
        if (left == total - left - v) return (NSInteger)i;
        left += v;
    }
    return -1;
}

int main(void) {
    @autoreleasepool {
        NSLog(@"%ld", (long)equilibriumIndex(@[@1, @7, @3, @6, @5, @6])); // 3
    }
    return 0;
}
