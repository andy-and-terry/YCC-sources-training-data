#import <Foundation/Foundation.h>

static NSString *zigzag(NSString *s, NSInteger rows) {
    if (rows == 1 || rows >= (NSInteger)s.length) return s;
    NSMutableArray<NSMutableString *> *lines = [NSMutableArray array];
    for (NSInteger i = 0; i < rows; i++) [lines addObject:[NSMutableString string]];
    NSInteger r = 0, step = 1;
    for (NSUInteger i = 0; i < s.length; i++) {
        [lines[r] appendFormat:@"%C", [s characterAtIndex:i]];
        if (r == 0) step = 1; else if (r == rows - 1) step = -1;
        r += step;
    }
    return [lines componentsJoinedByString:@""];
}

int main(void) {
    @autoreleasepool { NSLog(@"%@", zigzag(@"PAYPALISHIRING", 3)); }
    return 0;
}
