#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface Greeter : NSObject
- (NSString *)message;
@end

@implementation Greeter
- (NSString *)message { return @"original"; }
@end

@interface Greeter (Swizzled)
- (NSString *)swizzledMessage;
@end

@implementation Greeter (Swizzled)
- (NSString *)swizzledMessage {
    NSString *base = [self swizzledMessage];
    return [NSString stringWithFormat:@"[wrapped %@]", base];
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        Greeter *g = [[Greeter alloc] init];
        NSLog(@"before: %@", [g message]);

        Method m1 = class_getInstanceMethod([Greeter class], @selector(message));
        Method m2 = class_getInstanceMethod([Greeter class], @selector(swizzledMessage));
        method_exchangeImplementations(m1, m2);

        NSLog(@"after: %@", [g message]);
    }
    return 0;
}
