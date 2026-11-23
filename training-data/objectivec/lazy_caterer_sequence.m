#import <Foundation/Foundation.h>

// n(n+1)/2+1
static long term(long n) {
    return ((n * (n + 1)) / 2) + 1;
}

int main(void) {
    @autoreleasepool {
        for (long n = 1; n <= 15; n++) {
            NSLog(@"%ld -> %ld", n, term(n));
        }
    }
    return 0;
}
