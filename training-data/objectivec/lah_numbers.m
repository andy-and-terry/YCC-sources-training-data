#import <Foundation/Foundation.h>

static unsigned long lah(int n, int k) {
    unsigned long c = 1, f = 1;
    for (int i = 0; i < k - 1; i++) c = c * (n - 1 - i) / (i + 1);
    for (int i = k + 1; i <= n; i++) f *= i;
    return c * f;
}

int main(void) {
    @autoreleasepool {
        for (int n = 1; n <= 5; n++) {
            NSMutableArray *row = [NSMutableArray array];
            for (int k = 1; k <= n; k++) [row addObject:@(lah(n, k))];
            NSLog(@"%@", [row componentsJoinedByString:@" "]);
        }
    }
    return 0;
}
