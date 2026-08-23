#import <Foundation/Foundation.h>

NSInteger minCoins(NSArray *coins, NSInteger amount) {
    NSInteger dp[amount + 1];
    dp[0] = 0;
    for (NSInteger n = 1; n <= amount; n++) {
        dp[n] = -1;
        for (NSNumber *coin in coins) {
            NSInteger c = coin.integerValue;
            if (c <= n && dp[n - c] != -1) {
                if (dp[n] == -1 || dp[n - c] + 1 < dp[n]) {
                    dp[n] = dp[n - c] + 1;
                }
            }
        }
    }
    return dp[amount];
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"%ld", (long)minCoins(@[ @1, @2, @5 ], 11));
    }
    return 0;
}
