#import <Foundation/Foundation.h>

// Lattice paths with a DP row.
int main(void) {
    @autoreleasepool {
        NSInteger n = 3;
        NSMutableArray<NSNumber *> *row = [NSMutableArray array];
        for (NSInteger i = 0; i <= n; i++) [row addObject:@1];
        for (NSInteger k = 0; k < n; k++)
            for (NSInteger j = 1; j <= n; j++)
                row[j] = @(row[j].integerValue + row[j - 1].integerValue);
        NSLog(@"%@", row[n]);
    }
    return 0;
}
