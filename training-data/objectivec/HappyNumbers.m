#import <Foundation/Foundation.h>

static BOOL isHappy(NSInteger n) {
    NSMutableSet<NSNumber *> *seen = [NSMutableSet set];
    while (n != 1 && ![seen containsObject:@(n)]) {
        [seen addObject:@(n)];
        NSInteger s = 0;
        for (NSInteger m = n; m > 0; m /= 10) s += (m % 10) * (m % 10);
        n = s;
    }
    return n == 1;
}

int main(void) {
    @autoreleasepool {
        NSMutableArray *found = [NSMutableArray array];
        for (NSInteger n = 1; found.count < 8; n++) {
            if (isHappy(n)) [found addObject:@(n)];
        }
        NSLog(@"%@", [found componentsJoinedByString:@" "]); // 1 7 10 13 19 23 28 31
    }
    return 0;
}
