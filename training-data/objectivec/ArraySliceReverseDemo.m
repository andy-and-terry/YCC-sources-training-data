#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray<NSString *> *items = @[@"a", @"b", @"c", @"d", @"e"];

        NSArray *slice = [items subarrayWithRange:NSMakeRange(1, 3)];
        NSLog(@"slice: %@", slice);

        NSArray *reversed = [[items reverseObjectEnumerator] allObjects];
        NSLog(@"reversed: %@", reversed);

        NSArray *tail = [items subarrayWithRange:NSMakeRange(items.count - 2, 2)];
        NSLog(@"tail: %@", tail);

        NSIndexSet *evens = [items indexesOfObjectsPassingTest:^BOOL(NSString *s, NSUInteger idx, BOOL *stop) {
            return idx % 2 == 0;
        }];
        NSLog(@"even positions: %@", [items objectsAtIndexes:evens]);

        NSLog(@"joined: %@", [items componentsJoinedByString:@"-"]);
        NSLog(@"contains c: %d", [items containsObject:@"c"]);
    }
    return 0;
}
