#import <Foundation/Foundation.h>

BOOL subsetSum(NSArray<NSNumber *> *nums, NSInteger target) {
    BOOL dp[target + 1];
    memset(dp, 0, sizeof(dp));
    dp[0] = YES;
    for (NSNumber *numObj in nums) {
        NSInteger n = numObj.integerValue;
        for (NSInteger sum = target; sum >= n; sum--) {
            if (dp[sum - n]) dp[sum] = YES;
        }
    }
    return dp[target];
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray<NSNumber *> *nums = @[ @3, @34, @4, @12, @5, @2 ];
        NSLog(@"%@", subsetSum(nums, 9) ? @"YES" : @"NO");
        NSLog(@"%@", subsetSum(nums, 10) ? @"YES" : @"NO");
        NSLog(@"%@", subsetSum(nums, 100) ? @"YES" : @"NO");
    }
    return 0;
}
