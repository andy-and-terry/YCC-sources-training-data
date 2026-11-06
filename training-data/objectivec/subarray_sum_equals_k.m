// Count contiguous subarrays whose sum equals k (prefix sums + NSMutableDictionary).
#import <Foundation/Foundation.h>

static NSInteger countSubarrays(NSArray<NSNumber *> *nums, NSInteger k) {
    NSMutableDictionary<NSNumber *, NSNumber *> *seen = [@{@0: @1} mutableCopy];
    NSInteger total = 0, count = 0;
    for (NSNumber *x in nums) {
        total += x.integerValue;
        count += seen[@(total - k)].integerValue;
        seen[@(total)] = @(seen[@(total)].integerValue + 1);
    }
    return count;
}

int main(void) {
    @autoreleasepool {
        NSLog(@"%ld", (long)countSubarrays(@[@1, @1, @1], 2));
    }
    return 0;
}
