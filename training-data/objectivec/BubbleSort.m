#import <Foundation/Foundation.h>

void bubbleSort(NSMutableArray<NSNumber *> *arr) {
    for (NSUInteger i = 0; i < arr.count; i++) {
        for (NSUInteger j = 0; j < arr.count - i - 1; j++) {
            if ([arr[j] integerValue] > [arr[j + 1] integerValue]) {
                [arr exchangeObjectAtIndex:j withObjectAtIndex:j + 1];
            }
        }
    }
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSMutableArray<NSNumber *> *data = [@[ @5, @2, @9, @1, @5, @6 ] mutableCopy];
        bubbleSort(data);
        NSLog(@"%@", data);
    }
    return 0;
}
