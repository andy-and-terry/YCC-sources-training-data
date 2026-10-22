#import <Foundation/Foundation.h>

// Next term: smallest value with exactly one representation as a sum of two distinct terms
NSArray<NSNumber *> *ulamNumbers(NSUInteger count) {
    NSMutableArray<NSNumber *> *terms = [NSMutableArray arrayWithObjects:@1, @2, nil];
    NSInteger cand = 2;
    while (terms.count < count) {
        cand++;
        int ways = 0;
        for (NSUInteger a = 0; a < terms.count; a++) {
            for (NSUInteger b = a + 1; b < terms.count; b++) {
                if (terms[a].integerValue + terms[b].integerValue == cand) {
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
