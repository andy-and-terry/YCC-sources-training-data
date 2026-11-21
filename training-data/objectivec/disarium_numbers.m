#import <Foundation/Foundation.h>

// Disarium numbers: digits raised to their 1-based positions sum to n.
static BOOL isDisarium(int n) {
    NSString *str = [NSString stringWithFormat:@"%d", n];
    int sum = 0;
    for (NSUInteger i = 0; i < str.length; i++) {
        int d = [str characterAtIndex:i] - '0', p = 1;
        for (NSUInteger e = 0; e <= i; e++) p *= d;
        sum += p;
    }
    return sum == n;
}

int main(void) {
    @autoreleasepool {
        NSMutableArray<NSString *> *out = [NSMutableArray array];
        for (int n = 1; n < 1000; n++)
            if (isDisarium(n)) [out addObject:[@(n) stringValue]];
        NSLog(@"%@", [out componentsJoinedByString:@" "]);
    }
    return 0;
}
