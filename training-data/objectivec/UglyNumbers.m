#import <Foundation/Foundation.h>

static long long ugly(NSInteger n) {
    NSMutableArray<NSNumber *> *seq = [NSMutableArray arrayWithObject:@1];
    NSUInteger i2 = 0, i3 = 0, i5 = 0;
    while ((NSInteger)seq.count < n) {
        long long c2 = seq[i2].longLongValue * 2, c3 = seq[i3].longLongValue * 3, c5 = seq[i5].longLongValue * 5;
        long long next = MIN(c2, MIN(c3, c5));
        [seq addObject:@(next)];
        if (next == c2) i2++;
        if (next == c3) i3++;
        if (next == c5) i5++;
    }
    return seq[n - 1].longLongValue;
}

int main(void) {
    @autoreleasepool {
        NSMutableArray *out = [NSMutableArray array];
        for (NSInteger i = 1; i <= 12; i++) [out addObject:@(ugly(i))];
        NSLog(@"%@", [out componentsJoinedByString:@" "]);
    }
    return 0;
}
