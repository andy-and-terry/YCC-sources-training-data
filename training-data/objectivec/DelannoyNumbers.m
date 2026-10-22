#import <Foundation/Foundation.h>

// Central Delannoy numbers: D(m,n) = D(m-1,n) + D(m,n-1) + D(m-1,n-1)
NSArray<NSNumber *> *centralDelannoy(NSInteger last) {
    long long d[10][10];
    NSMutableArray<NSNumber *> *diagonal = [NSMutableArray array];
    for (NSInteger m = 0; m <= last; m++) {
        for (NSInteger n = 0; n <= last; n++) {
            d[m][n] = (m == 0 || n == 0) ? 1 : d[m - 1][n] + d[m][n - 1] + d[m - 1][n - 1];
        }
        [diagonal addObject:@(d[m][m])];
    }
    return diagonal;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"%@", [centralDelannoy(9) componentsJoinedByString:@" "]);
    }
    return 0;
}
