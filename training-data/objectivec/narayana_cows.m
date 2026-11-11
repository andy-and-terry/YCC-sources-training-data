// Narayana's cows N(n)=N(n-1)+N(n-3)
#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSMutableArray<NSNumber *> *v = [@[@1, @1, @1] mutableCopy];
        for (NSUInteger i = 3; i < 10; i++) {
            long next = [v[i - 1] longValue] + [v[i - 3] longValue];
            [v addObject:@(next)];
        }
        NSLog(@"%@", [v componentsJoinedByString:@" "]);
    }
    return 0;
}
