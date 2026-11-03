#import <Foundation/Foundation.h>

static NSString *swapCase(NSString *s) {
    NSMutableString *out = [NSMutableString string];
    for (NSUInteger i = 0; i < s.length; i++) {
        unichar c = [s characterAtIndex:i];
        if ([[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember:c])
            c = [[NSCharacterSet lowercaseLetterCharacterSet] characterIsMember:c] ? c : (c + 32);
        else if (c >= 'a' && c <= 'z')
            c -= 32;
        [out appendFormat:@"%C", c];
    }
    return out;
}

int main(void) {
    @autoreleasepool {
        NSLog(@"%@", swapCase(@"Hello World 42"));
    }
    return 0;
}
