#import <Foundation/Foundation.h>

NSInteger knapsack(NSArray *weights, NSArray *values, NSInteger capacity) {
    NSInteger dp[capacity + 1];
    memset(dp, 0, sizeof(dp));
    for (NSUInteger i = 0; i < weights.count; i++) {
        NSInteger w = [weights[i] integerValue];
        NSInteger v = [values[i] integerValue];
        for (NSInteger cap = capacity; cap >= w; cap--) {
            dp[cap] = MAX(dp[cap], dp[cap - w] + v);
        }
    }
    return dp[capacity];
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"%ld", (long)knapsack(@[ @2, @3, @4, @5 ], @[ @3, @4, @5, @6 ], 5));
    }
    return 0;
}
