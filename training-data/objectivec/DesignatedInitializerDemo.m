#import <Foundation/Foundation.h>

@interface Rectangle : NSObject
@property(nonatomic, readonly) double width;
@property(nonatomic, readonly) double height;
- (instancetype)initWithWidth:(double)width height:(double)height NS_DESIGNATED_INITIALIZER;
- (instancetype)initSquare:(double)side;
- (instancetype)init NS_UNAVAILABLE;
- (double)area;
@end

@implementation Rectangle
- (instancetype)initWithWidth:(double)width height:(double)height {
    self = [super init];
    if (self) {
        _width = width;
        _height = height;
    }
    return self;
}

- (instancetype)initSquare:(double)side {
    return [self initWithWidth:side height:side];
}

- (double)area { return _width * _height; }
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        Rectangle *r = [[Rectangle alloc] initWithWidth:3 height:4];
        Rectangle *s = [[Rectangle alloc] initSquare:5];
        NSLog(@"rect area %.1f, square area %.1f", [r area], [s area]);
    }
    return 0;
}
