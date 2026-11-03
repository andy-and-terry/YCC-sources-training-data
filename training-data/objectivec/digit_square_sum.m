#import <Foundation/Foundation.h>

static NSInteger digitSquareSum(NSInteger n) {
    n = labs(n);
    NSInteger sum = 0;
    for (; n > 0; n /= 10) sum += (n % 10) * (n % 10);
    return sum;
}

int main(void) {
    @autoreleasepool {
        NSLog(@"%ld %ld", (long)digitSquareSum(123), (long)digitSquareSum(-99));
    }
    return 0;
}
