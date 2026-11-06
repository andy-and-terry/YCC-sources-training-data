// Highest value reached by the Collatz (hailstone) sequence from n.
#import <Foundation/Foundation.h>

static long long peak(long long n) {
    long long best = n;
    while (n != 1) {
        n = (n % 2 == 0) ? n / 2 : 3 * n + 1;
        if (n > best) best = n;
    }
    return best;
}

int main(void) {
    @autoreleasepool {
        NSLog(@"%lld", peak(27));
    }
    return 0;
}
