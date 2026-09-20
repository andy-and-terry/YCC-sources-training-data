#import <Foundation/Foundation.h>

NSInteger longestCommonSubsequence(NSString *a, NSString *b) {
    NSInteger n = a.length;
    NSInteger m = b.length;
    NSInteger dp[n + 1][m + 1];

    for (NSInteger i = 0; i <= n; i++) dp[i][0] = 0;
    for (NSInteger j = 0; j <= m; j++) dp[0][j] = 0;

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
        NSLog(@"%ld", (long)longestCommonSubsequence(@"abc", @"def"));
    }
    return 0;
}
