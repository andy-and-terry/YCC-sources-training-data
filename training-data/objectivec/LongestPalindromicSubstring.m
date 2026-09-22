#import <Foundation/Foundation.h>

NSInteger expandFromCenter(NSString *s, NSInteger l, NSInteger r) {
    while (l >= 0 && r < (NSInteger)s.length && [s characterAtIndex:l] == [s characterAtIndex:r]) {
        l--;
        r++;
    }
    return r - l - 1;
}

NSString *longestPalindrome(NSString *s) {
    if (s.length == 0) return @"";
    NSInteger start = 0;
    NSInteger maxLen = 1;
    for (NSInteger i = 0; i < (NSInteger)s.length; i++) {
        NSInteger len1 = expandFromCenter(s, i, i);
        NSInteger len2 = expandFromCenter(s, i, i + 1);
        NSInteger len = MAX(len1, len2);
        if (len > maxLen) {
            maxLen = len;
            start = i - (len - 1) / 2;
        }
    }
    return [s substringWithRange:NSMakeRange(start, maxLen)];
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"%@", longestPalindrome(@"babad"));
        NSLog(@"%@", longestPalindrome(@"cbbd"));
    }
    return 0;
}
