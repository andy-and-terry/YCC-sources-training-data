#import <Foundation/Foundation.h>

// Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
static BOOL isMunchausen(int n) {
    int sum = 0;
    for (int m = n; m > 0; m /= 10) {
        int d = m % 10, p = d ? 1 : 0;
        for (int i = 0; i < d; i++) p *= d;
        sum += p;
    }
    return sum == n;
}

int main(void) {
    @autoreleasepool {
        NSMutableArray<NSString *> *out = [NSMutableArray array];
        for (int n = 1; n < 5000; n++)
            if (isMunchausen(n)) [out addObject:[@(n) stringValue]];
        NSLog(@"%@", [out componentsJoinedByString:@" "]);
    }
    return 0;
}
