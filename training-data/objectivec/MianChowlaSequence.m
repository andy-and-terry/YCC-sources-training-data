#import <Foundation/Foundation.h>

// Greedy sequence whose pairwise sums are all distinct.
int main(void) {
    @autoreleasepool {
        NSMutableArray<NSNumber *> *seq = [NSMutableArray array];
        NSMutableSet<NSNumber *> *sums = [NSMutableSet set];
        for (int cand = 1; seq.count < 8; cand++) {
            NSMutableSet<NSNumber *> *fresh = [NSMutableSet set];
            BOOL ok = YES;
            NSArray<NSNumber *> *all = [seq arrayByAddingObject:@(cand)];
            for (NSNumber *x in all) {
                NSNumber *s = @(x.intValue + cand);
                if ([sums containsObject:s] || [fresh containsObject:s]) { ok = NO; break; }
                [fresh addObject:s];
            }
            if (ok) {
                [seq addObject:@(cand)];
                [sums unionSet:fresh];
            }
        }
        NSLog(@"%@", [seq componentsJoinedByString:@" "]);
    }
    return 0;
}
