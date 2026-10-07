#import <Foundation/Foundation.h>

NSArray<NSArray<NSNumber *> *> *matrixMultiply(NSArray<NSArray<NSNumber *> *> *a, NSArray<NSArray<NSNumber *> *> *b) {
    NSInteger rows = a.count;
    NSInteger inner = b.count;
    NSInteger cols = b[0].count;
    NSMutableArray<NSMutableArray<NSNumber *> *> *result = [NSMutableArray arrayWithCapacity:rows];
    for (NSInteger i = 0; i < rows; i++) {
        NSMutableArray<NSNumber *> *row = [NSMutableArray arrayWithCapacity:cols];
        for (NSInteger j = 0; j < cols; j++) {
            NSInteger sum = 0;
            for (NSInteger k = 0; k < inner; k++) {
                sum += [a[i][k] integerValue] * [b[k][j] integerValue];
            }
            [row addObject:@(sum)];
        }
        [result addObject:row];
    }
    return result;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray<NSArray<NSNumber *> *> *a = @[ @[ @1, @2 ], @[ @3, @4 ] ];
        NSArray<NSArray<NSNumber *> *> *b = @[ @[ @5, @6 ], @[ @7, @8 ] ];
        NSLog(@"%@", matrixMultiply(a, b));
    }
    return 0;
}
