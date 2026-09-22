#import <Foundation/Foundation.h>

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
- (double)area { return M_PI * _radius * _radius; }
- (NSString *)name { return @"Circle"; }
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
- (double)area { return _side * _side; }
- (NSString *)name { return @"Square"; }
@end

typedef NS_ENUM(NSInteger, ShapeKind) {
    ShapeKindCircle,
    ShapeKindSquare,
};

@interface ShapeFactory : NSObject
+ (id<Shape>)shapeOfKind:(ShapeKind)kind withSize:(double)size;
@end

@implementation ShapeFactory
+ (id<Shape>)shapeOfKind:(ShapeKind)kind withSize:(double)size {
    switch (kind) {
        case ShapeKindCircle:
            return [[Circle alloc] initWithRadius:size];
        case ShapeKindSquare:
            return [[Square alloc] initWithSide:size];
    }
    return nil;
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray<NSNumber *> *kinds = @[ @(ShapeKindCircle), @(ShapeKindSquare) ];
        for (NSNumber *kind in kinds) {
            id<Shape> shape = [ShapeFactory shapeOfKind:kind.integerValue withSize:3.0];
            NSLog(@"%@ area = %.2f", shape.name, shape.area);
        }
    }
    return 0;
}
