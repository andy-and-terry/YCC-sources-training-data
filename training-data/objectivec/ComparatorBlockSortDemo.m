#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray<NSString *> *words = @[ @"pear", @"fig", @"banana", @"kiwi", @"apple" ];

        // An NSComparator is a block returning NSOrderedAscending/Same/Descending.
        NSComparator byLength = ^NSComparisonResult(NSString *a, NSString *b) {
            return [@(a.length) compare:@(b.length)];
        };
        NSLog(@"by length: %@", [words sortedArrayUsingComparator:byLength]);

        // Compose comparators: length first, then alphabetical as tie-breaker.
        NSComparator lengthThenAlpha = ^NSComparisonResult(NSString *a, NSString *b) {
            NSComparisonResult r = byLength(a, b);
            return r != NSOrderedSame ? r : [a compare:b];
        };
        NSLog(@"length+alpha: %@", [words sortedArrayUsingComparator:lengthThenAlpha]);

        // Reverse an existing comparator by swapping its arguments.
        NSComparator descending = ^NSComparisonResult(NSString *a, NSString *b) {
            return lengthThenAlpha(b, a);
        };
        NSMutableArray<NSString *> *mutable = [words mutableCopy];
        [mutable sortUsingComparator:descending];
        NSLog(@"descending: %@", mutable);

        // Binary search in an already sorted array with the same comparator.
        NSArray *sorted = [words sortedArrayUsingComparator:lengthThenAlpha];
        NSUInteger idx = [sorted indexOfObject:@"kiwi"
                                 inSortedRange:NSMakeRange(0, sorted.count)
                                       options:NSBinarySearchingFirstEqual
                               usingComparator:lengthThenAlpha];
        NSLog(@"kiwi at index %lu", (unsigned long)idx);
    }
    return 0;
}
