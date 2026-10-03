#import <Foundation/Foundation.h>

@interface Shape : NSObject <NSCopying>
@property (nonatomic, strong) NSString *color;
@property (nonatomic) NSInteger radius;
@end

@implementation Shape
- (id)copyWithZone:(NSZone *)zone {
    Shape *copy = [[Shape allocWithZone:zone] init];
    copy.color = self.color;
    copy.radius = self.radius;
    return copy;
}
- (NSString *)description {
    return [NSString stringWithFormat:@"Shape(color=%@, radius=%ld)", self.color, (long)self.radius];
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        Shape *original = [[Shape alloc] init];
        original.color = @"red";
        original.radius = 5;

        Shape *clone = [original copy];
        clone.color = @"blue";

        NSLog(@"%@", original);
        NSLog(@"%@", clone);
    }
    return 0;
}
