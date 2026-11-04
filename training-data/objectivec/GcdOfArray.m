#import <Foundation/Foundation.h>

static NSInteger gcd(NSInteger a, NSInteger b) { return b == 0 ? labs(a) : gcd(b, a % b); }

static NSInteger gcdAll(NSArray<NSNumber *> *nums) {
    NSInteger g = 0;
    for (NSNumber *n in nums) g = gcd(g, n.integerValue);
    return g;
}

int main(void) {
    @autoreleasepool {
        NSLog(@"%ld", (long)gcdAll(@[@12, @18, @24]));
        NSLog(@"%ld", (long)gcdAll(@[@7, @13]));
    }
    return 0;
}
