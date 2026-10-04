#import <Foundation/Foundation.h>

@interface Greeter : NSObject
- (NSString *)hello;
- (NSString *)goodbye;
@end

@implementation Greeter
- (NSString *)hello { return @"Hello!"; }
- (NSString *)goodbye { return @"Goodbye!"; }
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        Greeter *g = [[Greeter alloc] init];
        for (NSString *name in @[ @"hello", @"goodbye", @"missing" ]) {
            SEL sel = NSSelectorFromString(name);
            if ([g respondsToSelector:sel]) {
                NSLog(@"%@ -> %@", name, [g performSelector:sel]);
            } else {
                NSLog(@"%@ not supported", name);
            }
        }
    }
    return 0;
}
