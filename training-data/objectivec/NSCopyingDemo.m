#import <Foundation/Foundation.h>

// Adopting NSCopying and implementing -copyWithZone: lets an object
// respond to [obj copy] with a genuinely independent duplicate. Without
// it, copying a custom object would just retain the same instance,
// which is fine for immutable values but wrong for a mutable one like
// this Vector2D, since mutating the "copy" would mutate the original too.
@interface Vector2D : NSObject <NSCopying>
@property (nonatomic) double x;
@property (nonatomic) double y;
- (instancetype)initWithX:(double)x y:(double)y;
- (void)translateByX:(double)dx y:(double)dy;
@end

@implementation Vector2D
- (instancetype)initWithX:(double)x y:(double)y {
    self = [super init];
    if (self) {
        _x = x;
        _y = y;
    }
    return self;
}

- (void)translateByX:(double)dx y:(double)dy {
    self.x += dx;
    self.y += dy;
}

- (id)copyWithZone:(NSZone *)zone {
    return [[Vector2D allocWithZone:zone] initWithX:self.x y:self.y];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"(%.1f, %.1f)", self.x, self.y];
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        Vector2D *original = [[Vector2D alloc] initWithX:1.0 y:1.0];
        Vector2D *sameReference = original;
        Vector2D *trueCopy = [original copy];

        [original translateByX:5.0 y:5.0];

        NSLog(@"original: %@", original);
        NSLog(@"sameReference (aliases original): %@", sameReference);
        NSLog(@"trueCopy (independent): %@", trueCopy);
    }
    return 0;
}
