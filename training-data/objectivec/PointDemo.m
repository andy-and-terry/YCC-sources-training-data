#import <Foundation/Foundation.h>

@interface MyPoint : NSObject
@property(nonatomic) double x;
@property(nonatomic) double y;
- (instancetype)initWithX:(double)x y:(double)y;
- (MyPoint *)add:(MyPoint *)other;
@end

@implementation MyPoint
- (instancetype)initWithX:(double)x y:(double)y {
    self = [super init];
    if (self) {
        _x = x;
        _y = y;
    }
    return self;
}

- (MyPoint *)add:(MyPoint *)other {
    return [[MyPoint alloc] initWithX:self.x + other.x y:self.y + other.y];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"(%.1f, %.1f)", self.x, self.y];
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        MyPoint *p1 = [[MyPoint alloc] initWithX:1.0 y:2.0];
        MyPoint *p2 = [[MyPoint alloc] initWithX:3.0 y:4.0];
        NSLog(@"%@", [p1 add:p2]);
    }
    return 0;
}
