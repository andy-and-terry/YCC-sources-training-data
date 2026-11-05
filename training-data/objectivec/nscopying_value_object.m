#import <Foundation/Foundation.h>

@interface Pt : NSObject <NSCopying>
@property double x, y;
@end
@implementation Pt
- (id)copyWithZone:(NSZone *)z {
    Pt *c = [[Pt allocWithZone:z] init];
    c.x = self.x; c.y = self.y;
    return c;
}
@end

int main(void) {
    @autoreleasepool {
        Pt *a = [Pt new]; a.x = 1; a.y = 2;
        Pt *b = [a copy]; b.x = 9;
        NSLog(@"%g %g", a.x, b.x);
    }
    return 0;
}
