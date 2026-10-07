#import <Foundation/Foundation.h>

void shellSort(NSMutableArray<NSNumber *> *arr) {
    NSInteger n = arr.count;
    for (NSInteger gap = n / 2; gap > 0; gap /= 2) {
        for (NSInteger i = gap; i < n; i++) {
            NSNumber *temp = arr[i];
            NSInteger j = i;
            while (j >= gap && [arr[j - gap] integerValue] > temp.integerValue) {
                arr[j] = arr[j - gap];
                j -= gap;
            }
            arr[j] = temp;
        }
    }
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSMutableArray<NSNumber *> *data = [@[ @12, @34, @54, @2, @3 ] mutableCopy];
        shellSort(data);
        NSLog(@"%@", data);
    }
    return 0;
}
