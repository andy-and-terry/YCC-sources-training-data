#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSArray<NSNumber *> *a = @[@10, @9, @2, @5, @3, @7, @101, @18];
        NSMutableArray<NSNumber *> *tails = [NSMutableArray array];
        for (NSNumber *x in a) {
            NSUInteger i = [tails indexOfObject:x
                                  inSortedRange:NSMakeRange(0, tails.count)
                                        options:NSBinarySearchingFirstEqual | NSBinarySearchingInsertionIndex
                                usingComparator:^NSComparisonResult(id l, id r) { return [l compare:r]; }];
            if (i == tails.count) [tails addObject:x]; else tails[i] = x;
        }
        NSLog(@"%lu", (unsigned long)tails.count);
    }
    return 0;
}
