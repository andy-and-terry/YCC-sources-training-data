#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSMutableOrderedSet<NSString *> *set = [NSMutableOrderedSet orderedSet];
        for (NSString *s in @[ @"b", @"a", @"b", @"c", @"a" ]) {
            [set addObject:s];
        }
        NSLog(@"%@", set.array);
        [set moveObjectsAtIndexes:[NSIndexSet indexSetWithIndex:2] toIndex:0];
        NSLog(@"%@", set.array);
        NSLog(@"index of a: %lu", (unsigned long)[set indexOfObject:@"a"]);
    }
    return 0;
}
