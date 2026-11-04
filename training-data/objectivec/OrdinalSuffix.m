#import <Foundation/Foundation.h>

static NSString *ordinal(NSInteger n) {
    NSInteger r100 = n % 100, r10 = n % 10;
    NSString *s = (r100 >= 11 && r100 <= 13) ? @"th"
                : r10 == 1 ? @"st" : r10 == 2 ? @"nd" : r10 == 3 ? @"rd" : @"th";
    return [NSString stringWithFormat:@"%ld%@", (long)n, s];
}

int main(void) {
    @autoreleasepool {
        NSMutableArray *out = [NSMutableArray array];
        for (NSNumber *n in @[@1, @2, @3, @4, @11, @12, @13, @21, @101, @111])
            [out addObject:ordinal(n.integerValue)];
        NSLog(@"%@", [out componentsJoinedByString:@" "]);
    }
    return 0;
}
