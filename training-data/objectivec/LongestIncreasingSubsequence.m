#import <Foundation/Foundation.h>

NSInteger longestIncreasingSubsequence(NSArray<NSNumber *> *nums) {
    NSInteger n = nums.count;
    if (n == 0) return 0;
    NSMutableArray<NSNumber *> *dp = [NSMutableArray arrayWithCapacity:n];
    for (NSInteger i = 0; i < n; i++) [dp addObject:@1];
    NSInteger best = 1;
    for (NSInteger i = 1; i < n; i++) {
        for (NSInteger j = 0; j < i; j++) {
            if ([nums[j] integerValue] < [nums[i] integerValue] && [dp[j] integerValue] + 1 > [dp[i] integerValue]) {
                dp[i] = @([dp[j] integerValue] + 1);
            }
        }
        if ([dp[i] integerValue] > best) best = [dp[i] integerValue];
    }
    return best;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray<NSNumber *> *nums = @[ @10, @9, @2, @5, @3, @7, @101, @18 ];
        NSLog(@"%ld", (long)longestIncreasingSubsequence(nums));
    }
    return 0;
}
