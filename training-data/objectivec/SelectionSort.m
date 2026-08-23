#import <Foundation/Foundation.h>

NSArray *selectionSort(NSArray *items) {
    NSMutableArray *arr = [items mutableCopy];
    for (NSUInteger i = 0; i < arr.count - 1; i++) {
        NSUInteger minIdx = i;
        for (NSUInteger j = i + 1; j < arr.count; j++) {
            if ([arr[j] compare:arr[minIdx]] == NSOrderedAscending) {
                minIdx = j;
            }
        }
        [arr exchangeObjectAtIndex:i withObjectAtIndex:minIdx];
    }
    return arr;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray *data = @[ @5, @3, @8, @1, @9, @2 ];
        NSLog(@"%@", selectionSort(data));
    }
    return 0;
}
