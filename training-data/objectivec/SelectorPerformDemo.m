#import <Foundation/Foundation.h>

@interface Greeter : NSObject
- (NSString *)hello;
- (NSString *)goodbye;
- (NSString *)greet:(NSString *)name;
@end

@implementation Greeter
- (NSString *)hello { return @"hello"; }
- (NSString *)goodbye { return @"goodbye"; }
- (NSString *)greet:(NSString *)name { return [@"hi " stringByAppendingString:name]; }
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        Greeter *g = [[Greeter alloc] init];
        for (NSString *name in @[ @"hello", @"goodbye", @"missing" ]) {
            SEL sel = NSSelectorFromString(name);
            if ([g respondsToSelector:sel]) {
                NSLog(@"%@ -> %@", name, [g performSelector:sel]);
            } else {
                NSLog(@"%@ is not implemented", name);
            }
        }
        NSLog(@"%@", [g performSelector:@selector(greet:) withObject:@"Ann"]);
    }
    return 0;
}
