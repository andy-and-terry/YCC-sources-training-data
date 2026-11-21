#import <Foundation/Foundation.h>

// Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
static BOOL isBouncy(int n) {
    BOOL inc = YES, dec = YES;
    int prev = n % 10;
    for (int m = n / 10; m > 0; m /= 10) {
        int d = m % 10;
        if (d > prev) inc = NO;
        if (d < prev) dec = NO;
        prev = d;
    }
    return !inc && !dec;
}

int main(void) {
    @autoreleasepool {
        int count = 0;
        for (int n = 1; n < 1000; n++)
            if (isBouncy(n)) count++;
        NSLog(@"%d", count);
    }
    return 0;
}
