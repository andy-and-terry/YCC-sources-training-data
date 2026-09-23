#import <Foundation/Foundation.h>

// dp[s] is true when some subset of the numbers seen so far sums to s.
// Iterating the target sum downward keeps each number from being reused
// within the same pass.
BOOL subsetSum(NSArray<NSNumber *> *nums, NSInteger target) {
    BOOL dp[target + 1];
    memset(dp, 0, sizeof(dp));
    dp[0] = YES;

    for (NSNumber *numObj in nums) {
        NSInteger n = [numObj integerValue];
        for (NSInteger s = target; s >= n; s--) {
            if (dp[s - n]) dp[s] = YES;
        }
    }
    return dp[target];
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray<NSNumber *> *nums = @[ @3, @34, @4, @12, @5, @2 ];
        NSLog(@"%d", subsetSum(nums, 9));
        NSLog(@"%d", subsetSum(nums, 30));
        NSLog(@"%d", subsetSum(nums, 10));
    }
    return 0;
}
