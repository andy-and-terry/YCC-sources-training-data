#import <Foundation/Foundation.h>

// n(2n^2+1)/3
static long term(long n) {
    return (n * (((2 * n) * n) + 1)) / 3;
}

int main(void) {
    @autoreleasepool {
        for (long n = 1; n <= 15; n++) {
            NSLog(@"%ld -> %ld", n, term(n));
        }
    }
    return 0;
}
