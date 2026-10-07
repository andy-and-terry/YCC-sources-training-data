#import <Foundation/Foundation.h>

NSInteger ternarySearch(NSArray<NSNumber *> *arr, NSInteger target) {
    NSInteger lo = 0, hi = arr.count - 1;
    while (lo <= hi) {
        NSInteger third = (hi - lo) / 3;
        NSInteger m1 = lo + third;
        NSInteger m2 = hi - third;
        if ([arr[m1] integerValue] == target) return m1;
        if ([arr[m2] integerValue] == target) return m2;
        if (target < [arr[m1] integerValue]) {
            hi = m1 - 1;
        } else if (target > [arr[m2] integerValue]) {
            lo = m2 + 1;
        } else {
            lo = m1 + 1;
            hi = m2 - 1;
        }
    }
    return -1;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray<NSNumber *> *arr = @[ @1, @3, @5, @7, @9, @11, @13, @15 ];
        NSLog(@"%ld", (long)ternarySearch(arr, 9));
        NSLog(@"%ld", (long)ternarySearch(arr, 4));
    }
    return 0;
}
