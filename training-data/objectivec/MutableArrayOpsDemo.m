#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSMutableArray<NSNumber *> *a = [NSMutableArray arrayWithObjects:@10, @20, @30, nil];

        [a addObject:@40];
        [a insertObject:@5 atIndex:0];
        [a replaceObjectAtIndex:2 withObject:@25];
        NSLog(@"%@", a);

        [a removeObject:@30];
        [a removeObjectAtIndex:0];
        NSLog(@"%@", a);

        [a exchangeObjectAtIndex:0 withObjectAtIndex:a.count - 1];
        NSLog(@"swapped: %@", a);

        [a removeObjectsInRange:NSMakeRange(1, 1)];
        NSLog(@"range removed: %@", a);

        [a addObjectsFromArray:@[@1, @2]];
        NSLog(@"index of 2: %lu", (unsigned long)[a indexOfObject:@2]);
        NSLog(@"last: %@ first: %@", a.lastObject, a.firstObject);

        [a removeAllObjects];
        NSLog(@"count: %lu", (unsigned long)a.count);
    }
    return 0;
}
