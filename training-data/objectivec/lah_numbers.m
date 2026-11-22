#import <Foundation/Foundation.h>

// Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
static long fact(int n) { return n <= 1 ? 1 : n * fact(n - 1); }
static long comb(int n, int k) { return fact(n) / (fact(k) * fact(n - k)); }

int main(void) {
    @autoreleasepool {
        int n = 5;
        NSMutableArray<NSNumber *> *out = [NSMutableArray array];
        for (int k = 1; k <= n; k++) [out addObject:@(comb(n - 1, k - 1) * fact(n) / fact(k))];
        NSLog(@"%@", [out componentsJoinedByString:@" "]);
    }
    return 0;
}
