#import <Foundation/Foundation.h>
#include <math.h>

// Cantor pairing function and its inverse.
static long pairFn(long x, long y) { return (x + y) * (x + y + 1) / 2 + y; }

static void unpair(long z, long *x, long *y) {
    long w = (long)((sqrt(8.0 * z + 1) - 1) / 2);
    *y = z - w * (w + 1) / 2;
    *x = w - *y;
}

int main(void) {
    @autoreleasepool {
        long x, y;
        NSLog(@"%ld", pairFn(3, 4));
        unpair(32, &x, &y);
        NSLog(@"%ld %ld", x, y);
    }
    return 0;
}
