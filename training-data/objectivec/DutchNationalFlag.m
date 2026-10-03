#import <Foundation/Foundation.h>

void sortColors(NSMutableArray<NSNumber *> *nums) {
    NSInteger low = 0, mid = 0, high = nums.count - 1;
    while (mid <= high) {
        NSInteger v = [nums[mid] integerValue];
        if (v == 0) {
            [nums exchangeObjectAtIndex:low withObjectAtIndex:mid];
            low++; mid++;
        } else if (v == 1) {
            mid++;
        } else {
            [nums exchangeObjectAtIndex:mid withObjectAtIndex:high];
            high--;
        }
    }
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSMutableArray<NSNumber *> *nums = [@[ @2, @0, @2, @1, @1, @0 ] mutableCopy];
        sortColors(nums);
        NSLog(@"%@", nums);
    }
    return 0;
}
