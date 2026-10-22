#import <Foundation/Foundation.h>

// Start with odds, then delete every k-th survivor for each surviving k
NSArray<NSNumber *> *luckyNumbers(NSInteger limit) {
    NSMutableArray<NSNumber *> *nums = [NSMutableArray array];
    for (NSInteger v = 1; v <= limit; v += 2) {
        [nums addObject:@(v)];
    }
    for (NSUInteger i = 1; i < nums.count && nums[i].unsignedIntegerValue <= nums.count; i++) {
        NSUInteger step = nums[i].unsignedIntegerValue;
        NSMutableArray<NSNumber *> *kept = [NSMutableArray array];
        for (NSUInteger j = 0; j < nums.count; j++) {
            if ((j + 1) % step != 0) {
                [kept addObject:nums[j]];
            }
        }
        nums = kept;
    }
    return nums;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"%@", [luckyNumbers(50) componentsJoinedByString:@" "]);
    }
    return 0;
}
