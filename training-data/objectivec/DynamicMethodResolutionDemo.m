#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface Ghost : NSObject
- (void)boo;
@end

static void booImplementation(id self, SEL _cmd) {
    NSLog(@"boo from %@ via %@", [self class], NSStringFromSelector(_cmd));
}

@implementation Ghost
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(boo)) {
        class_addMethod(self, sel, (IMP)booImplementation, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        Ghost *g = [[Ghost alloc] init];
        NSLog(@"responds before call: %d", [g respondsToSelector:@selector(boo)]);
        [g boo];
        NSLog(@"responds after call: %d", [g respondsToSelector:@selector(boo)]);
    }
    return 0;
}
