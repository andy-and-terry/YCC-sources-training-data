#import <Foundation/Foundation.h>

NSArray *quicksort(NSArray *items) {
    if (items.count <= 1) return items;
    NSNumber *pivot = items[items.count / 2];
    NSMutableArray *left = [NSMutableArray array];
    NSMutableArray *mid = [NSMutableArray array];
    NSMutableArray *right = [NSMutableArray array];

    for (NSNumber *x in items) {
        if ([x compare:pivot] == NSOrderedAscending) {
            [left addObject:x];
        } else if ([x compare:pivot] == NSOrderedSame) {
            [mid addObject:x];
        } else {
            [right addObject:x];
        }
    }

    NSMutableArray *result = [NSMutableArray arrayWithArray:quicksort(left)];
    [result addObjectsFromArray:mid];
    [result addObjectsFromArray:quicksort(right)];
    return result;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray *data = @[ @5, @3, @8, @1, @9, @2 ];
        NSLog(@"%@", quicksort(data));
    }
    return 0;
}
