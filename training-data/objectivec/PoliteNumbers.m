#import <Foundation/Foundation.h>

// Ways to write n as a sum of two or more consecutive positive integers.
static int politeWays(int n) {
    int ways = 0;
    for (int k = 2; k * (k + 1) / 2 <= n; k++)
        if ((n - k * (k - 1) / 2) % k == 0) ways++;
    return ways;
}

int main(void) {
    @autoreleasepool {
        NSMutableArray<NSNumber *> *out = [NSMutableArray array];
        for (int n = 1; n <= 16; n++) [out addObject:@(politeWays(n))];
        NSLog(@"%@", [out componentsJoinedByString:@" "]);
    }
    return 0;
}
