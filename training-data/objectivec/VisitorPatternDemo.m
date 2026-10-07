#import <Foundation/Foundation.h>

// The visitor pattern separates an operation from the object structure
// it runs over. Each element accepts a visitor and calls the visitor
// method matching its own concrete type, giving "double dispatch"
// without Objective-C needing multiple-dispatch method overloading.
@protocol ShapeVisitor <NSObject>
- (void)visitCircle:(id)circle;
- (void)visitSquare:(id)square;
@end

@protocol VisitableShape <NSObject>
- (void)acceptVisitor:(id<ShapeVisitor>)visitor;
@end

@interface VCircle : NSObject <VisitableShape>
@property (nonatomic) double radius;
- (instancetype)initWithRadius:(double)radius;
@end

@implementation VCircle
- (instancetype)initWithRadius:(double)radius {
    self = [super init];
    if (self) _radius = radius;
    return self;
}
- (void)acceptVisitor:(id<ShapeVisitor>)visitor {
    [visitor visitCircle:self];
}
@end

@interface VSquare : NSObject <VisitableShape>
@property (nonatomic) double side;
- (instancetype)initWithSide:(double)side;
@end

@implementation VSquare
- (instancetype)initWithSide:(double)side {
    self = [super init];
    if (self) _side = side;
    return self;
}
- (void)acceptVisitor:(id<ShapeVisitor>)visitor {
    [visitor visitSquare:self];
}
@end

// One visitor computes total area; a different visitor could render or
// serialize the same shapes without either shape class changing at all.
@interface AreaVisitor : NSObject <ShapeVisitor>
@property (nonatomic) double totalArea;
@end

@implementation AreaVisitor
- (void)visitCircle:(VCircle *)circle {
    self.totalArea += 3.14159265 * circle.radius * circle.radius;
}
- (void)visitSquare:(VSquare *)square {
    self.totalArea += square.side * square.side;
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray<id<VisitableShape>> *shapes = @[
            [[VCircle alloc] initWithRadius:2.0],
            [[VSquare alloc] initWithSide:3.0],
            [[VCircle alloc] initWithRadius:1.0],
        ];
        AreaVisitor *visitor = [[AreaVisitor alloc] init];
        for (id<VisitableShape> shape in shapes) {
            [shape acceptVisitor:visitor];
        }
        NSLog(@"total area: %.2f", visitor.totalArea);
    }
    return 0;
}
