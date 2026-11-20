#import <Foundation/Foundation.h>

// Remove consecutive duplicate characters.
int main(void) {
    @autoreleasepool {
        NSString *s = @"aabbbcdd";
        NSMutableString *out = [NSMutableString string];
        for (NSUInteger i = 0; i < s.length; i++)
            if (i == 0 || [s characterAtIndex:i] != [s characterAtIndex:i - 1])
                [out appendFormat:@"%C", [s characterAtIndex:i]];
        NSLog(@"%@", out);
    }
    return 0;
}
