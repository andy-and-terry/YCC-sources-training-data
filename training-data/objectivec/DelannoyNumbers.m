#import <Foundation/Foundation.h>

static long centralDelannoy(int n) {
    long g[8][8];
    for (int i = 0; i <= n; i++)
        for (int j = 0; j <= n; j++)
            g[i][j] = (i == 0 || j == 0) ? 1 : g[i - 1][j] + g[i][j - 1] + g[i - 1][j - 1];
    return g[n][n];
}

int main(void) {
    @autoreleasepool {
        NSMutableArray<NSNumber *> *out = [NSMutableArray array];
        for (int n = 0; n <= 5; n++) [out addObject:@(centralDelannoy(n))];
        NSLog(@"%@", [out componentsJoinedByString:@" "]); // 1 3 13 63 321 1683
    }
    return 0;
}
