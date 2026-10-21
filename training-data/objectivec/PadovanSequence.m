#import <Foundation/Foundation.h>

// Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1
int main(void) {
    @autoreleasepool {
        NSMutableArray<NSNumber *> *p = [NSMutableArray array];
        for (NSUInteger i = 0; i < 15; i++) {
            long v = i < 3 ? 1 : p[i - 2].longValue + p[i - 3].longValue;
            [p addObject:@(v)];
        }
        NSLog(@"%@", [p componentsJoinedByString:@" "]);
    }
    return 0;
}
