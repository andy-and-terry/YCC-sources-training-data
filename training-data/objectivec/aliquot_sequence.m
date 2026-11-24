#import <Foundation/Foundation.h>

// Aliquot sequence: replace n by the sum of its proper divisors.
static int aliquotSum(int n) {
    int s = 0;
    for (int d = 1; d <= n / 2; d++)
        if (n % d == 0) s += d;
    return s;
}

int main(void) {
    @autoreleasepool {
        NSMutableArray<NSNumber *> *seq = [NSMutableArray arrayWithObject:@12];
        while ([seq.lastObject intValue] > 1 && seq.count < 20)
            [seq addObject:@(aliquotSum([seq.lastObject intValue]))];
        NSLog(@"%@", [seq componentsJoinedByString:@" "]);
    }
    return 0;
}
