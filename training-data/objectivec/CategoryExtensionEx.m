#import <Foundation/Foundation.h>

@interface NSString (Reverse)
- (NSString *)reversedString;
@end

@implementation NSString (Reverse)
- (NSString *)reversedString {
    NSMutableString *out = [NSMutableString string];
    for (NSInteger i = self.length - 1; i >= 0; i--)
        [out appendFormat:@"%C", [self characterAtIndex:i]];
    return out;
}
@end

int main(void) {
    @autoreleasepool { NSLog(@"%@", [@"hello" reversedString]); }
    return 0;
}
