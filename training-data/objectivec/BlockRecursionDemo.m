#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        __block NSInteger (^factorial)(NSInteger);
        factorial = ^NSInteger(NSInteger n) {
            return n <= 1 ? 1 : n * factorial(n - 1);
        };
        NSLog(@"10! = %ld", (long)factorial(10));

        NSInteger (^__block fib)(NSInteger) = nil;
        fib = ^NSInteger(NSInteger n) {
            return n < 2 ? n : fib(n - 1) + fib(n - 2);
        };
        NSLog(@"fib(15) = %ld", (long)fib(15));

        factorial = nil;
        fib = nil;
    }
    return 0;
}
