#import <Foundation/Foundation.h>

// n^2(n+1)/2
static long term(long n) {
    return ((n * n) * (n + 1)) / 2;
}

int main(void) {
    @autoreleasepool {
        for (long n = 1; n <= 15; n++) {
            NSLog(@"%ld -> %ld", n, term(n));
        }
    }
    return 0;
}
