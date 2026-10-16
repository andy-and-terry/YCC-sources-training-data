#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSScanner *scanner = [NSScanner scannerWithString:@"width=120 height=45.5 name=box"];

        NSString *key = nil;
        while (![scanner isAtEnd]) {
            [scanner scanUpToString:@"=" intoString:&key];
            [scanner scanString:@"=" intoString:NULL];

            if ([key isEqualToString:@"width"]) {
                NSInteger w = 0;
                [scanner scanInteger:&w];
                NSLog(@"width: %ld", (long)w);
            } else if ([key isEqualToString:@"height"]) {
                double h = 0;
                [scanner scanDouble:&h];
                NSLog(@"height: %.1f", h);
            } else {
                NSString *val = nil;
                [scanner scanUpToCharactersFromSet:[NSCharacterSet whitespaceCharacterSet] intoString:&val];
                NSLog(@"%@: %@", key, val);
            }
            [scanner scanCharactersFromSet:[NSCharacterSet whitespaceCharacterSet] intoString:NULL];
        }
    }
    return 0;
}
