#import <Foundation/Foundation.h>

NSInteger rodCutting(NSArray<NSNumber *> *prices, NSInteger length) {
    NSInteger dp[length + 1];
    dp[0] = 0;
    for (NSInteger len = 1; len <= length; len++) {
        NSInteger best = NSIntegerMin;
        for (NSInteger cut = 1; cut <= len; cut++) {
            best = MAX(best, [prices[cut - 1] integerValue] + dp[len - cut]);
        }
        dp[len] = best;
    }
    return dp[length];
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray<NSNumber *> *prices = @[ @1, @5, @8, @9, @10, @17, @17, @20 ];
        NSLog(@"%ld", (long)rodCutting(prices, 8));
    }
    return 0;
}
