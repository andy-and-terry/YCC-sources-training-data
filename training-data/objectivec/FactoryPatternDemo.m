#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ShapeType) {
    ShapeTypeCircle,
    ShapeTypeSquare
};

@protocol Shape <NSObject>
- (double)area;
- (NSString *)name;
@end

@interface Circle : NSObject <Shape>
@property (nonatomic) double radius;
- (instancetype)initWithRadius:(double)radius;
@end

@implementation Circle
- (instancetype)initWithRadius:(double)radius {
    self = [super init];
    if (self) _radius = radius;
    return self;
}
- (double)area { return M_PI * self.radius * self.radius; }
- (NSString *)name { return @"circle"; }
@end

@interface Square : NSObject <Shape>
@property (nonatomic) double side;
- (instancetype)initWithSide:(double)side;
@end

@implementation Square
- (instancetype)initWithSide:(double)side {
    self = [super init];
    if (self) _side = side;
    return self;
}
- (double)area { return self.side * self.side; }
- (NSString *)name { return @"square"; }
@end

@interface ShapeFactory : NSObject
+ (id<Shape>)shapeOfType:(ShapeType)type withParam:(double)param;
@end

@implementation ShapeFactory
+ (id<Shape>)shapeOfType:(ShapeType)type withParam:(double)param {
    switch (type) {
        case ShapeTypeCircle:
            return [[Circle alloc] initWithRadius:param];
        case ShapeTypeSquare:
            return [[Square alloc] initWithSide:param];
    }
    return nil;
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        id<Shape> circle = [ShapeFactory shapeOfType:ShapeTypeCircle withParam:3.0];
        id<Shape> square = [ShapeFactory shapeOfType:ShapeTypeSquare withParam:4.0];
        NSLog(@"%@ area: %.2f", circle.name, circle.area);
        NSLog(@"%@ area: %.2f", square.name, square.area);
    }
    return 0;
}
