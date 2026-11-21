#import <Foundation/Foundation.h>

// Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
static int gcdI(int a, int b) { return b ? gcdI(b, a % b) : a; }

static int phi(int n) {
    int c = 0;
    for (int k = 1; k <= n; k++)
        if (gcdI(k, n) == 1) c++;
    return c;
}

static BOOL isPerfectTotient(int n) {
    int total = 0;
    for (int m = n; m > 1;) {
        m = phi(m);
        total += m;
    }
    return total == n;
}

int main(void) {
    @autoreleasepool {
        NSMutableArray<NSString *> *out = [NSMutableArray array];
        for (int n = 2; n < 200; n++)
            if (isPerfectTotient(n)) [out addObject:[@(n) stringValue]];
        NSLog(@"%@", [out componentsJoinedByString:@" "]);
    }
    return 0;
}
