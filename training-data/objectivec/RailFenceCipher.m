#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSString *s = @"WEAREDISCOVERED";
        NSMutableArray *rows = [NSMutableArray array];
        for (int i = 0; i < 3; i++) [rows addObject:[NSMutableString string]];
        int r = 0, dir = 1;
        for (NSUInteger i = 0; i < s.length; i++) {
            [rows[r] appendFormat:@"%C", [s characterAtIndex:i]];
            if (r == 0) dir = 1;
            if (r == 2) dir = -1;
            r += dir;
        }
        NSLog(@"%@", [rows componentsJoinedByString:@""]);
    }
    return 0;
}
