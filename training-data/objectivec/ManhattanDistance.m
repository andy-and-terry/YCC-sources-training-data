#import <Foundation/Foundation.h>

NSInteger manhattan(NSArray<NSNumber *> *a, NSArray<NSNumber *> *b) {
    NSInteger s = 0;
    for (NSUInteger i = 0; i < a.count; i++) {
        s += labs(a[i].integerValue - b[i].integerValue);
    }
    return s;
}

int main(void) {
    @autoreleasepool {
        NSLog(@"%ld", (long)manhattan(@[@1, @2], @[@4, @6]));
    }
    return 0;
}
