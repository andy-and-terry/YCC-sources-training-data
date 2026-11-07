#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSArray<NSArray<NSNumber *> *> *t = @[@[@2], @[@3, @4], @[@6, @5, @7], @[@4, @1, @8, @3]];
        NSMutableArray<NSNumber *> *dp = [t.lastObject mutableCopy];
        for (NSInteger r = (NSInteger)t.count - 2; r >= 0; r--) {
            for (NSUInteger i = 0; i < t[r].count; i++) {
                NSInteger m = MIN(dp[i].integerValue, dp[i + 1].integerValue);
                dp[i] = @(t[r][i].integerValue + m);
            }
        }
        NSLog(@"%@", dp[0]); // 11
    }
    return 0;
}
