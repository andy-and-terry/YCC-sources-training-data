#import <Foundation/Foundation.h>
#include <math.h>

static BOOL isPerfectSquare(long n) {
    if (n < 0) return NO;
    long r = (long)sqrt((double)n);
    return r * r == n;
}

int main(void) {
    @autoreleasepool {
        NSMutableArray *out = [NSMutableArray array];
        for (long n = 0; n < 30; n++)
            if (isPerfectSquare(n)) [out addObject:@(n)];
        NSLog(@"%@", out);
    }
    return 0;
}
