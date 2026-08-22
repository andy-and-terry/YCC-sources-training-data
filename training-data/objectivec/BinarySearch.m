#import <Foundation/Foundation.h>

NSInteger binarySearch(NSArray<NSNumber *> *arr, NSInteger target) {
    NSInteger low = 0;
    NSInteger high = arr.count - 1;
    while (low <= high) {
        NSInteger mid = (low + high) / 2;
        NSInteger value = [arr[mid] integerValue];
        if (value == target) {
            return mid;
        } else if (value < target) {
            low = mid + 1;
        } else {
            high = mid - 1;
        }
    }
    return -1;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray<NSNumber *> *sorted = @[ @1, @3, @5, @7, @9, @11, @13 ];
        NSLog(@"%ld", (long)binarySearch(sorted, 7));
        NSLog(@"%ld", (long)binarySearch(sorted, 4));
    }
    return 0;
}
