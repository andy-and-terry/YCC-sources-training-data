#import <Foundation/Foundation.h>

static BOOL isArmstrong(NSInteger n) {
    NSString *s = [NSString stringWithFormat:@"%ld", (long)n];
    NSInteger total = 0;
    for (NSUInteger i = 0; i < s.length; i++) {
        NSInteger d = [s characterAtIndex:i] - '0';
        total += (NSInteger)pow((double)d, (double)s.length);
    }
    return total == n;
}

int main(void) {
    @autoreleasepool {
        NSMutableArray *result = [NSMutableArray array];
        for (NSInteger n = 1; n < 1000; n++) {
            if (isArmstrong(n)) [result addObject:@(n)];
        }
        NSLog(@"%@", [result componentsJoinedByString:@" "]); // 1..9 153 370 371 407
    }
    return 0;
}
