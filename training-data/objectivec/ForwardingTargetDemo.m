#import <Foundation/Foundation.h>

@interface Engine : NSObject
- (void)start;
@end

@implementation Engine
- (void)start { NSLog(@"engine started"); }
@end

@interface Car : NSObject
@end

@implementation Car {
    Engine *_engine;
}
- (instancetype)init {
    if ((self = [super init])) {
        _engine = [[Engine alloc] init];
    }
    return self;
}
- (id)forwardingTargetForSelector:(SEL)sel {
    if ([_engine respondsToSelector:sel]) {
        return _engine;
    }
    return [super forwardingTargetForSelector:sel];
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        Car *car = [[Car alloc] init];
        [(id)car start];
        NSLog(@"car responds directly: %d", [car respondsToSelector:@selector(start)]);
    }
    return 0;
}
