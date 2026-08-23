#import <Foundation/Foundation.h>

NSArray *twoSum(NSArray *nums, NSInteger target) {
    NSMutableDictionary *seen = [NSMutableDictionary dictionary];
    for (NSUInteger i = 0; i < nums.count; i++) {
        NSInteger n = [nums[i] integerValue];
        NSInteger complement = target - n;
        NSNumber *idx = seen[@(complement)];
        if (idx) {
            return @[ idx, @(i) ];
        }
        seen[@(n)] = @(i);
    }
    return @[];
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"%@", twoSum(@[ @2, @7, @11, @15 ], 9));
    }
    return 0;
}
