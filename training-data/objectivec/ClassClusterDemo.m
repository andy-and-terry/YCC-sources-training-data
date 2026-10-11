#import <Foundation/Foundation.h>

@interface Shape : NSObject
+ (instancetype)shapeWithKind:(NSString *)kind size:(double)size;
- (double)area;
@end

@interface SquareShape : Shape
@property double side;
@end
@interface CircleShape : Shape
@property double radius;
@end

@implementation Shape
+ (instancetype)shapeWithKind:(NSString *)kind size:(double)size {
    if ([kind isEqualToString:@"square"]) {
        SquareShape *s = [SquareShape new];
        s.side = size;
        return s;
    }
    if ([kind isEqualToString:@"circle"]) {
        CircleShape *c = [CircleShape new];
        c.radius = size;
        return c;
    }
    return nil;
}
- (double)area { return 0; }
@end

@implementation SquareShape
- (double)area { return self.side * self.side; }
@end

@implementation CircleShape
- (double)area { return M_PI * self.radius * self.radius; }
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        for (NSString *kind in @[@"square", @"circle", @"hexagon"]) {
            Shape *s = [Shape shapeWithKind:kind size:2];
            if (s) NSLog(@"%@ -> %@ area %.2f", kind, NSStringFromClass([s class]), [s area]);
            else NSLog(@"%@ -> unsupported", kind);
        }
        NSLog(@"NSArray literal class is a cluster: %@", NSStringFromClass([@[@1] class]));
    }
    return 0;
}
