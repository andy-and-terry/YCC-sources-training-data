#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        int n = 8;
        for (int r = 0; r < n; r++) {
            NSMutableString *line = [NSMutableString stringWithString:
                [@"" stringByPaddingToLength:n - r - 1 withString:@" " startingAtIndex:0]];
            for (int c = 0; c <= r; c++)
                [line appendString:((r & c) == c) ? @"* " : @"  "];
            puts(line.UTF8String);
        }
    }
    return 0;
}
