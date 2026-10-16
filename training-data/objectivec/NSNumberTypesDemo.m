#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSNumber *i = @42;
        NSNumber *d = @3.14159;
        NSNumber *b = @YES;
        NSNumber *c = @'A';
        NSNumber *big = @(INT64_MAX);

        NSLog(@"int=%d double=%.2f bool=%d char=%c", i.intValue, d.doubleValue, b.boolValue, c.charValue);
        NSLog(@"as double: %f, as int: %d", i.doubleValue, d.intValue);
        NSLog(@"big: %lld", big.longLongValue);
        NSLog(@"string: %@", [d stringValue]);

        NSLog(@"equal 42/42.0: %d", [i isEqualToNumber:@42.0]);
        NSLog(@"compare: %ld", (long)[i compare:@100]);

        int n = 7;
        NSNumber *expr = @(n * 6);
        NSLog(@"boxed expression: %@", expr);
    }
    return 0;
}
