#import <Foundation/Foundation.h>

NSInteger factorial(NSInteger n) {
    NSInteger result = 1;
    for (NSInteger i = 1; i <= n; i++) {
        result *= i;
    }
    return result;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"%ld", (long)factorial(10));
    }
    return 0;
}
