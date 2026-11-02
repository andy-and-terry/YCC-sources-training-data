#import <Foundation/Foundation.h>

@interface Point : NSObject <NSCopying>
@property (nonatomic) int x, y;
@end
@implementation Point
- (id)copyWithZone:(NSZone *)z {
    Point *p = [Point new]; p.x = self.x; p.y = self.y; return p;
}
@end

int main(void) {
    @autoreleasepool {
        Point *a = [Point new]; a.x = 1; a.y = 2;
        Point *b = [a copy]; b.x = 9;
        NSLog(@"%d %d", a.x, b.x);
    }
    return 0;
}
