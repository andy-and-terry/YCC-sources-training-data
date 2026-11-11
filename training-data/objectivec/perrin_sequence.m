// Perrin sequence P(n)=P(n-2)+P(n-3)
#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSMutableArray<NSNumber *> *v = [@[@3, @0, @2] mutableCopy];
        for (NSUInteger i = 3; i < 10; i++) {
            long next = [v[i - 2] longValue] + [v[i - 3] longValue];
            [v addObject:@(next)];
        }
        NSLog(@"%@", [v componentsJoinedByString:@" "]);
    }
    return 0;
}
