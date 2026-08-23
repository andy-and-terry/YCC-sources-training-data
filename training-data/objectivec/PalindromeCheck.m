#import <Foundation/Foundation.h>

BOOL isPalindrome(NSString *s) {
    NSString *lower = s.lowercaseString;
    NSMutableString *normalized = [NSMutableString string];
    for (NSUInteger i = 0; i < lower.length; i++) {
        unichar c = [lower characterAtIndex:i];
        if (isalnum(c)) [normalized appendFormat:@"%C", c];
    }
    NSMutableString *reversed = [NSMutableString string];
    for (NSInteger i = normalized.length - 1; i >= 0; i--) {
        [reversed appendFormat:@"%C", [normalized characterAtIndex:i]];
    }
    return [normalized isEqualToString:reversed];
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"%d", isPalindrome(@"A man, a plan, a canal: Panama"));
        NSLog(@"%d", isPalindrome(@"hello"));
    }
    return 0;
}
