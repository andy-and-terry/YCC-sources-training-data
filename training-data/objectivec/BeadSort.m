#import <Foundation/Foundation.h>

// Bead (gravity) sort.
int main(void) {
    @autoreleasepool {
        NSArray<NSNumber *> *nums = @[@5, @3, @1, @4, @2];
        NSMutableArray<NSNumber *> *cols = [NSMutableArray array];
        for (NSInteger i = 1; i <= 5; i++) {
            NSInteger c = 0;
            for (NSNumber *n in nums) if (n.integerValue >= i) c++;
            [cols addObject:@(c)];
        }
        NSMutableArray<NSNumber *> *rows = [NSMutableArray array];
        for (NSInteger r = 1; r <= 5; r++) {
            NSInteger c = 0;
            for (NSNumber *v in cols) if (v.integerValue >= r) c++;
            [rows insertObject:@(c) atIndex:0];
        }
        NSLog(@"%@", [rows componentsJoinedByString:@","]);
    }
    return 0;
}
