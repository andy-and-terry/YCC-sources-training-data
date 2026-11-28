#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSString *s = @"banana";
        NSUInteger n = s.length, i = 0;
        while (i < n) {
            NSUInteger j = i + 1, k = i;
            while (j < n && [s characterAtIndex:k] <= [s characterAtIndex:j]) {
                k = [s characterAtIndex:k] < [s characterAtIndex:j] ? i : k + 1;
                j++;
            }
            while (i <= k) {
                NSLog(@"%@", [s substringWithRange:NSMakeRange(i, j - k)]);
                i += j - k;
            }
        }
    }
    return 0;
}
