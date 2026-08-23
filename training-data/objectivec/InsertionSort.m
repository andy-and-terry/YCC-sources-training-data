#import <Foundation/Foundation.h>

NSArray *insertionSort(NSArray *items) {
    NSMutableArray *arr = [items mutableCopy];
    for (NSUInteger i = 1; i < arr.count; i++) {
        NSNumber *key = arr[i];
        NSInteger j = i - 1;
        while (j >= 0 && [arr[j] compare:key] == NSOrderedDescending) {
            arr[j + 1] = arr[j];
            j--;
        }
        arr[j + 1] = key;
    }
    return arr;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray *data = @[ @12, @11, @13, @5, @6 ];
        NSLog(@"%@", insertionSort(data));
    }
    return 0;
}
