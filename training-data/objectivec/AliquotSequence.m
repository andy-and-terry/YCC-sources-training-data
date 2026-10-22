#import <Foundation/Foundation.h>

// Repeatedly replace n by the sum of its proper divisors until 0
NSArray<NSNumber *> *aliquotSequence(NSInteger start) {
    NSMutableArray<NSNumber *> *terms = [NSMutableArray arrayWithObject:@(start)];
    NSInteger n = start;
    while (n > 0) {
        NSInteger sum = 0;
        for (NSInteger d = 1; d <= n / 2; d++) {
            if (n % d == 0) {
                sum += d;
            }
        }
        n = sum;
        [terms addObject:@(n)];
    }
    return terms;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"%@", [aliquotSequence(12) componentsJoinedByString:@" "]);
    }
    return 0;
}
