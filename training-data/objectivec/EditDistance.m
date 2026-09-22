#import <Foundation/Foundation.h>

NSInteger editDistance(NSString *a, NSString *b) {
    NSInteger n = a.length;
    NSInteger m = b.length;
    NSInteger dp[n + 1][m + 1];

    for (NSInteger i = 0; i <= n; i++) dp[i][0] = i;
    for (NSInteger j = 0; j <= m; j++) dp[0][j] = j;

    for (NSInteger i = 1; i <= n; i++) {
        for (NSInteger j = 1; j <= m; j++) {
            if ([a characterAtIndex:i - 1] == [b characterAtIndex:j - 1]) {
                dp[i][j] = dp[i - 1][j - 1];
            } else {
                NSInteger insertCost = dp[i][j - 1] + 1;
                NSInteger deleteCost = dp[i - 1][j] + 1;
                NSInteger replaceCost = dp[i - 1][j - 1] + 1;
                dp[i][j] = MIN(insertCost, MIN(deleteCost, replaceCost));
            }
        }
    }
    return dp[n][m];
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"%ld", (long)editDistance(@"kitten", @"sitting"));
        NSLog(@"%ld", (long)editDistance(@"flaw", @"lawn"));
    }
    return 0;
}
