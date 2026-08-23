#import <Foundation/Foundation.h>

BOOL isSafe(NSArray *queens, NSInteger col) {
    for (NSUInteger i = 0; i < queens.count; i++) {
        NSInteger q = [queens[i] integerValue];
        NSInteger dist = queens.count - i;
        if (q == col || labs(q - col) == dist) return NO;
    }
    return YES;
}

NSInteger solve(NSArray *queens, NSInteger n) {
    if (queens.count == (NSUInteger)n) return 1;
    NSInteger count = 0;
    for (NSInteger col = 0; col < n; col++) {
        if (isSafe(queens, col)) {
            count += solve([queens arrayByAddingObject:@(col)], n);
        }
    }
    return count;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"%ld", (long)solve(@[], 6));
    }
    return 0;
}
