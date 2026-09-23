#import <Foundation/Foundation.h>

// Counting sort avoids comparisons entirely: it tallies how many times
// each value occurs in a known small range, then reconstructs the
// sorted array from those counts. It runs in O(n + k) time, where k is
// the size of the value range, which beats comparison sorts when k is
// small relative to n.
NSArray<NSNumber *> *countingSort(NSArray<NSNumber *> *values, NSInteger maxValue) {
    NSMutableArray<NSNumber *> *counts = [NSMutableArray arrayWithCapacity:maxValue + 1];
    for (NSInteger i = 0; i <= maxValue; i++) [counts addObject:@0];

    for (NSNumber *value in values) {
        NSInteger v = value.integerValue;
        counts[v] = @(counts[v].integerValue + 1);
    }

    NSMutableArray<NSNumber *> *sorted = [NSMutableArray arrayWithCapacity:values.count];
    for (NSInteger v = 0; v <= maxValue; v++) {
        NSInteger occurrences = counts[v].integerValue;
        for (NSInteger i = 0; i < occurrences; i++) {
            [sorted addObject:@(v)];
        }
    }
    return sorted;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray<NSNumber *> *values = @[ @4, @2, @2, @8, @3, @3, @1, @0, @8 ];
        NSArray<NSNumber *> *sorted = countingSort(values, 8);
        NSLog(@"unsorted: %@", values);
        NSLog(@"sorted: %@", sorted);
    }
    return 0;
}
