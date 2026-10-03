#import <Foundation/Foundation.h>

NSInteger climbStairs(NSInteger n) {
    if (n <= 2) return n;
    NSInteger a = 1, b = 2;
    for (NSInteger i = 3; i <= n; i++) {
        NSInteger c = a + b;
        a = b;
        b = c;
    }
    return b;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"%ld", (long)climbStairs(5));
        NSLog(@"%ld", (long)climbStairs(10));
    }
    return 0;
}
