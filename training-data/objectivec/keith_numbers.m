#import <Foundation/Foundation.h>

// Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
static BOOL isKeith(int n) {
    NSString *str = [NSString stringWithFormat:@"%d", n];
    NSMutableArray<NSNumber *> *seq = [NSMutableArray array];
    for (NSUInteger i = 0; i < str.length; i++)
        [seq addObject:@([str characterAtIndex:i] - '0')];
    NSUInteger k = seq.count;
    while ([seq.lastObject intValue] < n) {
        int sum = 0;
        for (NSUInteger i = seq.count - k; i < seq.count; i++) sum += [seq[i] intValue];
        [seq addObject:@(sum)];
    }
    return [seq.lastObject intValue] == n;
}

int main(void) {
    @autoreleasepool {
        NSMutableArray<NSString *> *out = [NSMutableArray array];
        for (int n = 10; n < 1200; n++)
            if (isKeith(n)) [out addObject:[@(n) stringValue]];
        NSLog(@"%@", [out componentsJoinedByString:@" "]);
    }
    return 0;
}
