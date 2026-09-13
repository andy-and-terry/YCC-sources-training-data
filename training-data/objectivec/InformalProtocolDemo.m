#import <Foundation/Foundation.h>

@interface Duck : NSObject
- (NSString *)quack;
@end

@implementation Duck
- (NSString *)quack {
    return @"Quack!";
}
@end

@interface ToyDuck : NSObject
- (NSString *)quack;
@end

@implementation ToyDuck
- (NSString *)quack {
    return @"Squeak-quack!";
}
@end

void makeItQuack(id thing) {
    if ([thing respondsToSelector:@selector(quack)]) {
        NSLog(@"%@", [thing performSelector:@selector(quack)]);
    } else {
        NSLog(@"%@ cannot quack", thing);
    }
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray *things = @[ [[Duck alloc] init], [[ToyDuck alloc] init], [[NSObject alloc] init] ];
        for (id thing in things) {
            makeItQuack(thing);
        }
    }
    return 0;
}
