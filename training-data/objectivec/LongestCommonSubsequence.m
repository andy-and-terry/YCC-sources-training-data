#import <Foundation/Foundation.h>

NSString *longestCommonSubsequence(NSString *a, NSString *b) {
    NSInteger m = a.length;
    NSInteger n = b.length;
    NSMutableArray<NSMutableArray<NSNumber *> *> *dp = [NSMutableArray array];
    for (NSInteger i = 0; i <= m; i++) {
        NSMutableArray<NSNumber *> *row = [NSMutableArray array];
        for (NSInteger j = 0; j <= n; j++) [row addObject:@0];
        [dp addObject:row];
    }

    for (NSInteger i = 1; i <= m; i++) {
        for (NSInteger j = 1; j <= n; j++) {
            if ([a characterAtIndex:i - 1] == [b characterAtIndex:j - 1]) {
                dp[i][j] = @([dp[i - 1][j - 1] integerValue] + 1);
            } else {
                dp[i][j] = @(MAX([dp[i - 1][j] integerValue], [dp[i][j - 1] integerValue]));
            }
        }
    }

    NSMutableString *result = [NSMutableString string];
    NSInteger i = m, j = n;
    while (i > 0 && j > 0) {
        if ([a characterAtIndex:i - 1] == [b characterAtIndex:j - 1]) {
            [result insertString:[NSString stringWithFormat:@"%C", [a characterAtIndex:i - 1]] atIndex:0];
            i--;
            j--;
        } else if ([dp[i - 1][j] integerValue] >= [dp[i][j - 1] integerValue]) {
            i--;
        } else {
            j--;
        }
    }
    return result;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSString *result = longestCommonSubsequence(@"ABCBDAB", @"BDCABA");
        NSLog(@"%@ (length %lu)", result, (unsigned long)result.length);
    }
    return 0;
}
