#import <Foundation/Foundation.h>

@interface NSString (Rev)
- (NSString *)reversed;
@end

@implementation NSString (Rev)
- (NSString *)reversed {
    NSMutableString *s = [NSMutableString string];
    for (NSInteger i = self.length - 1; i >= 0; i--)
        [s appendFormat:@"%C", [self characterAtIndex:i]];
    return s;
}
@end

int main(void) {
    @autoreleasepool { NSLog(@"%@", [@"hello" reversed]); }
    return 0;
}
