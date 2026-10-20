#import <Foundation/Foundation.h>
@interface NSString (Reverse)
- (NSString *)reversed;
@end
@implementation NSString (Reverse)
- (NSString *)reversed {
    NSMutableString *r = [NSMutableString string];
    for (NSInteger i = self.length - 1; i >= 0; i--)
        [r appendFormat:@"%C", [self characterAtIndex:i]];
    return r;
}
@end
int main() { @autoreleasepool { NSLog(@"%@", [@"abc" reversed]); } return 0; }
