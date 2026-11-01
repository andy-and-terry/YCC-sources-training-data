#import <Foundation/Foundation.h>

// n is triangular iff 8n + 1 is a perfect square.
static BOOL isTriangular(int n) {
    int s = 8 * n + 1;
    int r = (int)lround(sqrt((double)s));
    return r * r == s;
}

int main(void) {
    @autoreleasepool {
        NSMutableArray<NSNumber *> *out = [NSMutableArray array];
        for (int n = 0; n <= 20; n++)
            if (isTriangular(n)) [out addObject:@(n)];
        NSLog(@"%@", [out componentsJoinedByString:@" "]);
    }
    return 0;
}
