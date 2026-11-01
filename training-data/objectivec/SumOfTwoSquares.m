#import <Foundation/Foundation.h>

// Positive n expressible as a*a + b*b with a, b >= 0.
static BOOL representable(int n) {
    for (int a = 0; a * a <= n; a++)
        for (int b = a; a * a + b * b <= n; b++)
            if (a * a + b * b == n) return YES;
    return NO;
}

int main(void) {
    @autoreleasepool {
        NSMutableArray<NSNumber *> *out = [NSMutableArray array];
        for (int n = 1; n <= 30; n++)
            if (representable(n)) [out addObject:@(n)];
        NSLog(@"%@", [out componentsJoinedByString:@" "]);
    }
    return 0;
}
