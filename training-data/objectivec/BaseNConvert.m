#import <Foundation/Foundation.h>

static NSString *toBase(NSUInteger n, NSUInteger base) {
    if (n == 0) return @"0";
    NSString *digits = @"0123456789abcdefghijklmnopqrstuvwxyz";
    NSMutableString *out = [NSMutableString string];
    while (n > 0) {
        [out insertString:[digits substringWithRange:NSMakeRange(n % base, 1)] atIndex:0];
        n /= base;
    }
    return out;
}

int main(void) {
    @autoreleasepool {
        for (NSNumber *b in @[@2, @8, @16, @36])
            NSLog(@"255 in base %@ = %@", b, toBase(255, b.unsignedIntegerValue));
    }
    return 0;
}
