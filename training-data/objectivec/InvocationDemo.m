#import <Foundation/Foundation.h>

@interface Calculator : NSObject
- (NSInteger)add:(NSInteger)a to:(NSInteger)b;
@end

@implementation Calculator
- (NSInteger)add:(NSInteger)a to:(NSInteger)b { return a + b; }
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        Calculator *calc = [[Calculator alloc] init];
        SEL sel = @selector(add:to:);

        NSMethodSignature *sig = [calc methodSignatureForSelector:sel];
        NSLog(@"arguments: %lu returns: %s", (unsigned long)sig.numberOfArguments, sig.methodReturnType);

        NSInvocation *inv = [NSInvocation invocationWithMethodSignature:sig];
        inv.target = calc;
        inv.selector = sel;
        NSInteger a = 30, b = 12;
        [inv setArgument:&a atIndex:2];
        [inv setArgument:&b atIndex:3];
        [inv invoke];

        NSInteger result = 0;
        [inv getReturnValue:&result];
        NSLog(@"result: %ld", (long)result);
    }
    return 0;
}
