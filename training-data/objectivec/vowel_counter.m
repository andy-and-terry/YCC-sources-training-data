#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSString *s = [@"Education is beautiful" lowercaseString];
        NSString *vowels = @"aeiou";
        NSMutableString *report = [NSMutableString string];
        for (NSUInteger v = 0; v < vowels.length; v++) {
            NSString *ch = [vowels substringWithRange:NSMakeRange(v, 1)];
            NSUInteger n = [s componentsSeparatedByString:ch].count - 1;
            [report appendFormat:@"%@=%lu ", ch, (unsigned long)n];
        }
        NSLog(@"%@", report);
    }
    return 0;
}
