#import <Foundation/Foundation.h>

// Lucky numbers: start with the odd numbers, then delete every k-th survivor,
// where k is the next surviving number
NSArray<NSNumber *> *luckyNumbers(NSInteger limit) {
    NSMutableArray *nums = [NSMutableArray array];
    for (NSInteger n = 1; n < limit; n += 2) {
        [nums addObject:@(n)];
    }
    NSUInteger idx = 1;
    while (idx < nums.count && [nums[idx] unsignedIntegerValue] <= nums.count) {
        NSUInteger k = [nums[idx] unsignedIntegerValue];
        NSMutableArray *kept = [NSMutableArray array];
        for (NSUInteger p = 0; p < nums.count; p++) {
            if ((p + 1) % k != 0) {
                [kept addObject:nums[p]];
            }
        }
        nums = kept;
        idx++;
    }
    return nums;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"%@", [luckyNumbers(100) componentsJoinedByString:@" "]);
    }
    return 0;
}
