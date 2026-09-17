#import <Foundation/Foundation.h>

void heapify(NSMutableArray<NSNumber *> *arr, NSInteger n, NSInteger i) {
    NSInteger largest = i;
    NSInteger left = 2 * i + 1;
    NSInteger right = 2 * i + 2;
    if (left < n && [arr[left] integerValue] > [arr[largest] integerValue]) largest = left;
    if (right < n && [arr[right] integerValue] > [arr[largest] integerValue]) largest = right;
    if (largest != i) {
        [arr exchangeObjectAtIndex:i withObjectAtIndex:largest];
        heapify(arr, n, largest);
    }
}

void heapSort(NSMutableArray<NSNumber *> *arr) {
    NSInteger n = arr.count;
    for (NSInteger i = n / 2 - 1; i >= 0; i--) {
        heapify(arr, n, i);
    }
    for (NSInteger i = n - 1; i > 0; i--) {
        [arr exchangeObjectAtIndex:0 withObjectAtIndex:i];
        heapify(arr, i, 0);
    }
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSMutableArray<NSNumber *> *data = [@[ @5, @3, @8, @1, @9, @2 ] mutableCopy];
        heapSort(data);
        NSLog(@"%@", data);
    }
    return 0;
}
