#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray *letters = @[ @"a", @"b", @"c", @"d", @"e", @"f", @"g" ];

        NSMutableIndexSet *set = [NSMutableIndexSet indexSet];
        [set addIndexesInRange:NSMakeRange(1, 3)];
        [set addIndex:6];
        NSLog(@"selected: %@", [letters objectsAtIndexes:set]);

        [set removeIndex:2];
        [set enumerateRangesUsingBlock:^(NSRange r, BOOL *stop) {
            NSLog(@"range %lu+%lu", (unsigned long)r.location, (unsigned long)r.length);
        }];

        NSIndexSet *evens = [letters indexesOfObjectsPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
            return idx % 2 == 0;
        }];
        NSLog(@"even slots: %@", [letters objectsAtIndexes:evens]);
        NSLog(@"count=%lu first=%lu last=%lu", (unsigned long)evens.count,
              (unsigned long)evens.firstIndex, (unsigned long)evens.lastIndex);
    }
    return 0;
}
