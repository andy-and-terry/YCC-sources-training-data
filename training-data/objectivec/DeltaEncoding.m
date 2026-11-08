#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSArray<NSNumber *> *xs = @[@10, @12, @15, @15, @20];
        NSMutableArray *d = [NSMutableArray arrayWithObject:xs[0]];
        for (NSUInteger i = 1; i < xs.count; i++)
            [d addObject:@(xs[i].intValue - xs[i - 1].intValue)];
        NSLog(@"%@", d);
        int acc = 0;
        NSMutableArray *back = [NSMutableArray array];
        for (NSNumber *n in d) { acc += n.intValue; [back addObject:@(acc)]; }
        NSLog(@"%@", back);
    }
    return 0;
}
