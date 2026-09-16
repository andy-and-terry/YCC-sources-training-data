#import <Foundation/Foundation.h>

static NSInteger Partition(NSMutableArray<NSNumber *> *arr, NSInteger low, NSInteger high) {
    NSInteger pivot = arr[high].integerValue;
    NSInteger i = low - 1;
    for (NSInteger j = low; j < high; j++) {
        if (arr[j].integerValue <= pivot) {
            i++;
            [arr exchangeObjectAtIndex:i withObjectAtIndex:j];
        }
    }
    [arr exchangeObjectAtIndex:(i + 1) withObjectAtIndex:high];
    return i + 1;
}

static NSInteger QuickSelect(NSMutableArray<NSNumber *> *arr, NSInteger low, NSInteger high, NSInteger k) {
    if (low == high) {
        return arr[low].integerValue;
    }
    NSInteger pivotIndex = Partition(arr, low, high);
    if (k == pivotIndex) {
        return arr[k].integerValue;
    } else if (k < pivotIndex) {
        return QuickSelect(arr, low, pivotIndex - 1, k);
    } else {
        return QuickSelect(arr, pivotIndex + 1, high, k);
    }
}

static NSInteger KthSmallest(NSArray<NSNumber *> *arr, NSInteger k) {
    NSMutableArray<NSNumber *> *copy = [arr mutableCopy];
    return QuickSelect(copy, 0, copy.count - 1, k - 1);
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray<NSNumber *> *data = @[ @7, @2, @9, @4, @1, @8, @3, @6 ];
        NSLog(@"%ld", (long)KthSmallest(data, 3));
        NSLog(@"%ld", (long)KthSmallest(data, 1));
        NSLog(@"%ld", (long)KthSmallest(data, data.count));
    }
    return 0;
}
