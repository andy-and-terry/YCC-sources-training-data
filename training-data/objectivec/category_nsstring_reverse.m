#import <Foundation/Foundation.h>
@interface NSString (Rev)
- (NSString *)reversed;
@end
@implementation NSString (Rev)
- (NSString *)reversed {
    NSMutableString *r = [NSMutableString string];
    for (NSInteger i = self.length - 1; i >= 0; i--) [r appendFormat:@"%C", [self characterAtIndex:i]];
    return r;
}
@end
int main(void) { @autoreleasepool { NSLog(@"%@", [@"hello" reversed]); } return 0; }
