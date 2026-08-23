#import <Foundation/Foundation.h>

NSArray *mergeArrays(NSArray *left, NSArray *right) {
    NSMutableArray *result = [NSMutableArray array];
    NSUInteger i = 0, j = 0;
    while (i < left.count && j < right.count) {
        if ([left[i] compare:right[j]] != NSOrderedDescending) {
            [result addObject:left[i++]];
        } else {
            [result addObject:right[j++]];
        }
    }
    while (i < left.count) [result addObject:left[i++]];
    while (j < right.count) [result addObject:right[j++]];
    return result;
}

NSArray *mergeSort(NSArray *items) {
    if (items.count <= 1) return items;
    NSUInteger mid = items.count / 2;
    NSArray *left = mergeSort([items subarrayWithRange:NSMakeRange(0, mid)]);
    NSArray *right = mergeSort([items subarrayWithRange:NSMakeRange(mid, items.count - mid)]);
    return mergeArrays(left, right);
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray *data = @[ @5, @2, @9, @1, @5, @6 ];
        NSLog(@"%@", mergeSort(data));
    }
    return 0;
}
