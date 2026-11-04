#import <Foundation/Foundation.h>

static BOOL isToeplitz(NSArray<NSArray<NSNumber *> *> *m) {
    for (NSUInteger i = 1; i < m.count; i++)
        for (NSUInteger j = 1; j < m[i].count; j++)
            if (![m[i][j] isEqualToNumber:m[i - 1][j - 1]]) return NO;
    return YES;
}

int main(void) {
    @autoreleasepool {
        NSLog(@"%d", isToeplitz(@[@[@1, @2, @3], @[@4, @1, @2], @[@5, @4, @1]]));
        NSLog(@"%d", isToeplitz(@[@[@1, @2], @[@2, @2]]));
    }
    return 0;
}
