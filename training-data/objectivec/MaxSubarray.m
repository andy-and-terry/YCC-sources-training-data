#import <Foundation/Foundation.h>

NSInteger kadane(NSArray *items) {
    NSInteger best = [items[0] integerValue];
    NSInteger current = best;
    for (NSUInteger i = 1; i < items.count; i++) {
        NSInteger x = [items[i] integerValue];
        current = MAX(x, current + x);
        best = MAX(best, current);
    }
    return best;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray *data = @[ @(-2), @1, @(-3), @4, @(-1), @2, @1, @(-5), @4 ];
        NSLog(@"%ld", (long)kadane(data));
    }
    return 0;
}
