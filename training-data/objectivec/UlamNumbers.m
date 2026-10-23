#import <Foundation/Foundation.h>

// Ulam numbers: after 1 and 2, the smallest number that is a sum of
// two distinct earlier terms in exactly one way
NSArray<NSNumber *> *ulamNumbers(NSInteger count) {
    NSMutableArray *terms = [NSMutableArray arrayWithObjects:@1, @2, nil];
    NSInteger cand = 2;
    while ((NSInteger)terms.count < count) {
        cand++;
        NSInteger ways = 0;
        for (NSUInteger a = 0; a < terms.count; a++) {
            for (NSUInteger b = a + 1; b < terms.count; b++) {
                if ([terms[a] integerValue] + [terms[b] integerValue] == cand) {
                    ways++;
                }
            }
        }
        if (ways == 1) {
            [terms addObject:@(cand)];
        }
    }
    return terms;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"%@", [ulamNumbers(15) componentsJoinedByString:@" "]);
    }
    return 0;
}
