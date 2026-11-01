#import <Foundation/Foundation.h>

@interface Box : NSObject
@property (copy) NSString *label;
@property (readonly) NSUInteger length;
@end
@implementation Box
- (NSUInteger)length { return self.label.length; }
@end

int main(void) {
    @autoreleasepool {
        NSMutableString *m = [NSMutableString stringWithString:@"abc"];
        Box *b = [Box new];
        b.label = m;
        [m appendString:@"def"];
        NSLog(@"%@ %lu", b.label, (unsigned long)b.length);
    }
    return 0;
}
