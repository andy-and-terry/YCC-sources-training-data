#import <Foundation/Foundation.h>

// Leyland numbers: x^y + y^x for x >= y >= 2.
static long long ipow(long long b, int e) {
    long long r = 1;
    while (e-- > 0) r *= b;
    return r;
}

int main(void) {
    @autoreleasepool {
        NSMutableArray<NSNumber *> *vals = [NSMutableArray array];
        for (int x = 2; x <= 4; x++)
            for (int y = 2; y <= x; y++)
                [vals addObject:@(ipow(x, y) + ipow(y, x))];
        NSLog(@"%@", [vals componentsJoinedByString:@" "]);
    }
    return 0;
}
