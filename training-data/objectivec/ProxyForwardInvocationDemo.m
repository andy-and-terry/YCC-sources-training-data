#import <Foundation/Foundation.h>

@interface LoggingProxy : NSProxy
- (instancetype)initWithTarget:(id)target;
@end

@implementation LoggingProxy {
    id _target;
}

- (instancetype)initWithTarget:(id)target {
    _target = target;
    return self;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [_target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    NSLog(@"calling %@", NSStringFromSelector(invocation.selector));
    [invocation invokeWithTarget:_target];
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSMutableArray *real = [NSMutableArray array];
        id proxy = [[LoggingProxy alloc] initWithTarget:real];

        [proxy addObject:@"x"];
        [proxy addObject:@"y"];
        NSLog(@"count via proxy: %lu", (unsigned long)[proxy count]);
        NSLog(@"real array: %@", real);
    }
    return 0;
}
