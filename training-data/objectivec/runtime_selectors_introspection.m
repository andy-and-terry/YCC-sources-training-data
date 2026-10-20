#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface Greeter : NSObject
- (NSString *)hello:(NSString *)name;
@end
@implementation Greeter
- (NSString *)hello:(NSString *)name { return [@"Hello, " stringByAppendingString:name]; }
@end

int main(void) {
    @autoreleasepool {
        Greeter *g = [Greeter new];
        SEL sel = @selector(hello:);
        NSLog(@"%@", [g performSelector:sel withObject:@"Ada"]);
        NSLog(@"%@ %@", NSStringFromClass([g class]), NSStringFromSelector(sel));
        NSLog(@"%d %d", [g isKindOfClass:[NSObject class]], [g isMemberOfClass:[NSObject class]]);
        Class c = NSClassFromString(@"Greeter");
        NSLog(@"%d", [c instancesRespondToSelector:sel]);
        unsigned int n = 0;
        Method *ms = class_copyMethodList([Greeter class], &n);
        NSLog(@"methods: %u", n);
        free(ms);
        NSLog(@"%s", class_getName(object_getClass(g)));
        IMP imp = [g methodForSelector:sel];
        NSString *(*fn)(id, SEL, NSString *) = (void *)imp;
        NSLog(@"%@", fn(g, sel, @"IMP"));
    }
    return 0;
}
