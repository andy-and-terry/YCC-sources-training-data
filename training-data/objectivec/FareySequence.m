#import <Foundation/Foundation.h>

// Farey sequence F_n: reduced fractions in [0,1] with denominator <= n
NSArray<NSString *> *fareySequence(NSInteger n) {
    NSMutableArray *terms = [NSMutableArray array];
    NSInteger a = 0, b = 1, c = 1, d = n;
    [terms addObject:[NSString stringWithFormat:@"%ld/%ld", (long)a, (long)b]];
    while (c <= n) {
        NSInteger k = (n + b) / d;
        NSInteger e = k * c - a;
        NSInteger f = k * d - b;
        a = c; b = d; c = e; d = f;
        [terms addObject:[NSString stringWithFormat:@"%ld/%ld", (long)a, (long)b]];
    }
    return terms;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"%@", [fareySequence(5) componentsJoinedByString:@" "]);
    }
    return 0;
}
