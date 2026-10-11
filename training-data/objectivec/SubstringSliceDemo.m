#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSString *s = @"Hello, Objective-C";

        NSLog(@"from 7: %@", [s substringFromIndex:7]);
        NSLog(@"to 5: %@", [s substringToIndex:5]);
        NSLog(@"range: %@", [s substringWithRange:NSMakeRange(7, 9)]);

        NSString *tail = [s substringFromIndex:s.length - 3];
        NSLog(@"last three: %@", tail);

        unichar c = [s characterAtIndex:0];
        NSLog(@"first char: %C (%d)", c, c);

        NSString *trimmed = [@"   padded  " stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        NSLog(@"trimmed: '%@'", trimmed);

        NSString *padded = [@"7" stringByPaddingToLength:3 withString:@"0" startingAtIndex:0];
        NSLog(@"padded right: %@", padded);
    }
    return 0;
}
