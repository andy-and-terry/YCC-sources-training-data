#import <Foundation/Foundation.h>

// Practical numbers: every m in 1..n is a sum of distinct divisors of n.
static BOOL isPractical(int n) {
    unsigned long long reach = 1ULL; // bit i set <=> i is a subset sum
    for (int d = 1; d <= n; d++)
        if (n % d == 0) reach |= reach << d;
    unsigned long long mask = (1ULL << (n + 1)) - 1;
    return (reach & mask) == mask;
}

int main(void) {
    @autoreleasepool {
        NSMutableArray<NSNumber *> *out = [NSMutableArray array];
        for (int n = 1; n <= 40; n++)
            if (isPractical(n)) [out addObject:@(n)];
        NSLog(@"%@", [out componentsJoinedByString:@" "]);
    }
    return 0;
}
