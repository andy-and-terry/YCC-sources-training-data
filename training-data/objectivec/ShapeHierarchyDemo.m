#import <Foundation/Foundation.h>

// A small class hierarchy showing inheritance and polymorphism: Shape
// defines the common interface but has no sensible implementation of
// its own, so it raises an exception if a subclass forgets to override
// -area, the same way Foundation classes signal "subclass must override".
@interface Shape : NSObject
@property (nonatomic, copy) NSString *name;
- (double)area;
- (NSString *)describe;
@end

@implementation Shape
- (double)area {
    [self doesNotRecognizeSelector:_cmd];
    return 0;
}

- (NSString *)describe {
    return [NSString stringWithFormat:@"%@ has area %.2f", self.name, [self area]];
}
@end

@interface Circle : Shape
@property (nonatomic) double radius;
- (instancetype)initWithRadius:(double)radius;
@end

@implementation Circle
- (instancetype)initWithRadius:(double)radius {
    self = [super init];
    if (self) {
        _radius = radius;
        self.name = @"Circle";
    }
    return self;
}

- (double)area {
    return 3.14159265 * self.radius * self.radius;
}
@end

@interface Rectangle : Shape
@property (nonatomic) double width;
@property (nonatomic) double height;
- (instancetype)initWithWidth:(double)width height:(double)height;
@end

@implementation Rectangle
- (instancetype)initWithWidth:(double)width height:(double)height {
    self = [super init];
    if (self) {
        _width = width;
        _height = height;
        self.name = @"Rectangle";
    }
    return self;
}

- (double)area {
    return self.width * self.height;
}
@end

// A subclass of Rectangle: every square is a rectangle with equal sides,
// so it reuses Rectangle's -area entirely and only changes construction.
@interface Square : Rectangle
- (instancetype)initWithSide:(double)side;
@end

@implementation Square
- (instancetype)initWithSide:(double)side {
    self = [super initWithWidth:side height:side];
    if (self) self.name = @"Square";
    return self;
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray<Shape *> *shapes = @[
            [[Circle alloc] initWithRadius:2.0],
            [[Rectangle alloc] initWithWidth:3.0 height:4.0],
            [[Square alloc] initWithSide:5.0],
        ];
        for (Shape *shape in shapes) {
            NSLog(@"%@", [shape describe]);
        }
    }
    return 0;
}
