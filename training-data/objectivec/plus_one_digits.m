#import <Foundation/Foundation.h>

static NSArray<NSNumber *> *plusOne(NSArray<NSNumber *> *digits) {
    NSMutableArray<NSNumber *> *d = [digits mutableCopy];
    for (NSInteger i = (NSInteger)d.count - 1; i >= 0; i--) {
        if (d[i].integerValue < 9) {
            d[i] = @(d[i].integerValue + 1);
            return d;
        }
        d[i] = @0;
    }
    [d insertObject:@1 atIndex:0];
    return d;
}

int main(void) {
    @autoreleasepool {
        NSLog(@"%@", [plusOne(@[@9, @9]) componentsJoinedByString:@""]); // 100
    }
    return 0;
}
