#import <Foundation/Foundation.h>

void backtrack(NSArray<NSNumber *> *candidates, NSInteger start, NSInteger remaining,
                NSMutableArray<NSNumber *> *current, NSMutableArray *results) {
    if (remaining == 0) {
        [results addObject:[current copy]];
        return;
    }
    if (remaining < 0) return;
    for (NSInteger i = start; i < candidates.count; i++) {
        [current addObject:candidates[i]];
        backtrack(candidates, i, remaining - [candidates[i] integerValue], current, results);
        [current removeLastObject];
    }
}

NSArray *combinationSum(NSArray<NSNumber *> *candidates, NSInteger target) {
    NSMutableArray *results = [NSMutableArray array];
    backtrack(candidates, 0, target, [NSMutableArray array], results);
    return results;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"%@", combinationSum(@[ @2, @3, @6, @7 ], 7));
    }
    return 0;
}
