#import <Foundation/Foundation.h>

int sigma(int n) {
    int s = 0;
    for (int d = 1; d <= n; d++) if (n % d == 0) s += d;
    return s;
}

int main(void) {
    @autoreleasepool {
        NSMutableArray *out = [NSMutableArray array];
        for (int n = 1; n <= 20; n++) if (sigma(n) < 2 * n) [out addObject:@(n)];
        NSLog(@"%@", [out componentsJoinedByString:@" "]);
    }
    return 0;
}
