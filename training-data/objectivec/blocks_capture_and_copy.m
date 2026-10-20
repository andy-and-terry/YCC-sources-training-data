#import <Foundation/Foundation.h>

typedef int (^BinaryOp)(int, int);

int main(void) {
    @autoreleasepool {
        BinaryOp add = ^(int a, int b) { return a + b; };
        NSLog(@"%d", add(2, 3));
        __block int counter = 0;
        void (^inc)(void) = ^{ counter++; };
        inc(); inc();
        NSLog(@"counter=%d", counter);
        int captured = 10;
        int (^byValue)(void) = ^{ return captured; };
        captured = 20;
        NSLog(@"%d %d", byValue(), captured);
        NSArray *nums = @[@3, @1, @2];
        NSArray *sorted = [nums sortedArrayUsingComparator:^NSComparisonResult(NSNumber *a, NSNumber *b) { return [a compare:b]; }];
        NSLog(@"%@", sorted);
        [nums enumerateObjectsUsingBlock:^(NSNumber *n, NSUInteger i, BOOL *stop) { if (i == 1) *stop = YES; NSLog(@"%lu:%@", (unsigned long)i, n); }];
    }
    return 0;
}
