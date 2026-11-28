#import <Foundation/Foundation.h>

NSInteger chebyshev(NSArray<NSNumber *> *a, NSArray<NSNumber *> *b) {
    NSInteger m = 0;
    for (NSUInteger i = 0; i < a.count; i++) {
        m = MAX(m, labs(a[i].integerValue - b[i].integerValue));
    }
    return m;
}

int main(void) {
    @autoreleasepool {
        NSLog(@"%ld", (long)chebyshev(@[@1, @2], @[@4, @6]));
    }
    return 0;
}
