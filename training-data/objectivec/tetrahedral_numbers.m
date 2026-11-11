// Tetrahedral numbers n(n+1)(n+2)/6
#import <Foundation/Foundation.h>

static long term(long n) { return ((n * (n + 1)) * (n + 2))/6; }

int main(void) {
    @autoreleasepool {
        NSMutableArray<NSNumber *> *out = [NSMutableArray array];
        for (long n = 0; n < 10; n++) [out addObject:@(term(n))];
        NSLog(@"%@", [out componentsJoinedByString:@" "]);
    }
    return 0;
}
