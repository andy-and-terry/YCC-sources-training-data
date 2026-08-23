#import <Foundation/Foundation.h>

@interface NSString (Reversed)
- (NSString *)reversedString;
@end

@implementation NSString (Reversed)
- (NSString *)reversedString {
    NSMutableString *result = [NSMutableString stringWithCapacity:self.length];
    for (NSInteger i = self.length - 1; i >= 0; i--) {
        [result appendFormat:@"%C", [self characterAtIndex:i]];
    }
    return result;
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"%@", [@"hello" reversedString]);
    }
    return 0;
}
