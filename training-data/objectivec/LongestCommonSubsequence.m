#import <Foundation/Foundation.h>

NSInteger longestCommonSubsequence(NSString *a, NSString *b) {
    NSInteger n = a.length;
    NSInteger m = b.length;
    NSInteger dp[n + 1][m + 1];
    memset(dp, 0, sizeof(dp));
    for (NSInteger i = 1; i <= n; i++) {
        for (NSInteger j = 1; j <= m; j++) {
            if ([a characterAtIndex:i - 1] == [b characterAtIndex:j - 1]) {
                dp[i][j] = dp[i - 1][j - 1] + 1;
            } else {
                dp[i][j] = MAX(dp[i - 1][j], dp[i][j - 1]);
            }
        }
    }
    return dp[n][m];
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"%ld", (long)longestCommonSubsequence(@"abcde", @"ace"));
        NSLog(@"%ld", (long)longestCommonSubsequence(@"abc", @"abc"));
    }
    return 0;
}
