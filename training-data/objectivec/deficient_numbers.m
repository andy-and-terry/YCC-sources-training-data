// Deficient numbers below 100; expect 76.
#import <Foundation/Foundation.h>

static NSInteger properSum(NSInteger n) {
    NSInteger t = 0;
    for (NSInteger d = 1; d < n; d++) if (n % d == 0) t += d;
    return t;
}

int main(void) {
    @autoreleasepool {
        NSInteger c = 0;
        for (NSInteger n = 1; n < 100; n++) if (properSum(n) < n) c++;
        NSLog(@"%ld", (long)c);
    }
    return 0;
}
