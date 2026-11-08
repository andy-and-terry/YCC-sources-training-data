#import <Foundation/Foundation.h>

NSString *rot47(NSString *s) {
    NSMutableString *out = [NSMutableString string];
    for (NSUInteger i = 0; i < s.length; i++) {
        unichar c = [s characterAtIndex:i];
        if (c >= 33 && c <= 126) c = 33 + (c - 33 + 47) % 94;
        [out appendFormat:@"%C", c];
    }
    return out;
}

int main(void) {
    @autoreleasepool {
        NSString *e = rot47(@"Hello, World!");
        NSLog(@"%@ -> %@", e, rot47(e));
    }
    return 0;
}
