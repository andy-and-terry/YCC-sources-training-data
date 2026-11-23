#import <Foundation/Foundation.h>

// 6n(n-1)+1
static long term(long n) {
    return ((6 * n) * (n - 1)) + 1;
}

int main(void) {
    @autoreleasepool {
        for (long n = 1; n <= 15; n++) {
            NSLog(@"%ld -> %ld", n, term(n));
        }
    }
    return 0;
}
