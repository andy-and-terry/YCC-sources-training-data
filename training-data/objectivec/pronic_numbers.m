// Pronic numbers n(n+1)
#import <Foundation/Foundation.h>

static long term(long n) { return n * (n + 1); }

int main(void) {
    @autoreleasepool {
        NSMutableArray<NSNumber *> *out = [NSMutableArray array];
        for (long n = 0; n < 10; n++) [out addObject:@(term(n))];
        NSLog(@"%@", [out componentsJoinedByString:@" "]);
    }
    return 0;
}
