#import <Foundation/Foundation.h>

static NSArray<NSNumber *> *NextGreaterElements(NSArray<NSNumber *> *nums) {
    NSMutableArray<NSNumber *> *result = [NSMutableArray arrayWithCapacity:nums.count];
    for (NSUInteger i = 0; i < nums.count; i++) {
        result[i] = @(-1);
    }
    NSMutableArray<NSNumber *> *stack = [NSMutableArray array];
    for (NSUInteger i = 0; i < nums.count; i++) {
        while (stack.count > 0 && nums[stack.lastObject.unsignedIntegerValue].integerValue < nums[i].integerValue) {
            NSUInteger top = stack.lastObject.unsignedIntegerValue;
            [stack removeLastObject];
            result[top] = nums[i];
        }
        [stack addObject:@(i)];
    }
    return result;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray<NSNumber *> *nums = @[ @2, @1, @2, @4, @3 ];
        NSLog(@"%@", NextGreaterElements(nums));
    }
    return 0;
}
