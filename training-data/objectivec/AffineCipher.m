#import <Foundation/Foundation.h>

NSString *affine(NSString *s, int a, int b) {
    NSMutableString *out = [NSMutableString string];
    for (NSUInteger i = 0; i < s.length; i++) {
        unichar ch = [s characterAtIndex:i];
        if (ch >= 'A' && ch <= 'Z') ch = 'A' + (a * (ch - 'A') + b) % 26;
        [out appendFormat:@"%C", ch];
    }
    return out;
}

int main(void) {
    @autoreleasepool {
        NSLog(@"%@", affine(@"AFFINE", 5, 8));
    }
    return 0;
}
