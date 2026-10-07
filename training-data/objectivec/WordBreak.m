#import <Foundation/Foundation.h>

BOOL wordBreak(NSString *s, NSSet<NSString *> *wordDict) {
    NSInteger n = s.length;
    BOOL dp[n + 1];
    memset(dp, 0, sizeof(dp));
    dp[0] = YES;
    for (NSInteger i = 1; i <= n; i++) {
        for (NSInteger j = 0; j < i; j++) {
            if (dp[j] && [wordDict containsObject:[s substringWithRange:NSMakeRange(j, i - j)]]) {
                dp[i] = YES;
                break;
            }
        }
    }
    return dp[n];
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSSet<NSString *> *dict = [NSSet setWithArray:@[ @"leet", @"code" ]];
        NSLog(@"%@", wordBreak(@"leetcode", dict) ? @"YES" : @"NO");
        NSLog(@"%@", wordBreak(@"leetcodex", dict) ? @"YES" : @"NO");
    }
    return 0;
}
