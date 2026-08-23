#import <Foundation/Foundation.h>

NSInteger binarySearch(NSArray *arr, NSInteger low, NSInteger high, NSInteger target) {
    if (low > high) return -1;
    NSInteger mid = (low + high) / 2;
    NSInteger midVal = [arr[mid] integerValue];
    if (midVal == target) return mid;
    if (midVal < target) return binarySearch(arr, mid + 1, high, target);
    return binarySearch(arr, low, mid - 1, target);
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray *data = @[ @1, @3, @5, @7, @9, @11 ];
        NSLog(@"%ld", (long)binarySearch(data, 0, data.count - 1, 7));
    }
    return 0;
}
