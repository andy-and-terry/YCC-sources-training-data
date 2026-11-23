#import <Foundation/Foundation.h>

// n(n+1)(n+2)/6
static long term(long n) {
    return ((n * (n + 1)) * (n + 2)) / 6;
}

int main(void) {
    @autoreleasepool {
        for (long n = 1; n <= 15; n++) {
            NSLog(@"%ld -> %ld", n, term(n));
        }
    }
    return 0;
}
