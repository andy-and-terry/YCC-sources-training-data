#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSMutableArray<NSNumber *> *sorted = [NSMutableArray arrayWithArray:@[ @2, @5, @8, @13 ]];

        for (NSNumber *value in @[ @7, @1, @20, @5 ]) {
            NSUInteger idx = [sorted indexOfObject:value
                                     inSortedRange:NSMakeRange(0, sorted.count)
                                           options:NSBinarySearchingInsertionIndex
                                   usingComparator:^NSComparisonResult(NSNumber *a, NSNumber *b) {
                                       return [a compare:b];
                                   }];
            [sorted insertObject:value atIndex:idx];
            NSLog(@"inserted %@ at %lu", value, (unsigned long)idx);
        }
        NSLog(@"%@", sorted);
    }
    return 0;
}
