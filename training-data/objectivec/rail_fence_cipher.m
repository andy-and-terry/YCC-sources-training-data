#import <Foundation/Foundation.h>

static NSString *encode(NSString *text, int rails) {
    NSMutableArray<NSMutableString *> *rows = [NSMutableArray array];
    for (int i = 0; i < rails; i++) [rows addObject:[NSMutableString string]];
    int r = 0, step = 1;
    for (NSUInteger i = 0; i < text.length; i++) {
        [rows[r] appendFormat:@"%C", [text characterAtIndex:i]];
        if (r == 0) step = 1;
        else if (r == rails - 1) step = -1;
        r += step;
    }
    return [rows componentsJoinedByString:@""];
}

int main(void) {
    @autoreleasepool { NSLog(@"%@", encode(@"WEAREDISCOVERED", 3)); }
    return 0;
}
