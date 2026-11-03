#import <Foundation/Foundation.h>

@interface RangeSum : NSObject
- (instancetype)initWithValues:(NSArray<NSNumber *> *)values;
- (long)queryFrom:(NSUInteger)lo to:(NSUInteger)hi;
@end

@implementation RangeSum {
    NSMutableArray<NSNumber *> *_prefix;
}
- (instancetype)initWithValues:(NSArray<NSNumber *> *)values {
    if ((self = [super init])) {
        _prefix = [NSMutableArray arrayWithObject:@0];
        for (NSNumber *v in values)
            [_prefix addObject:@(_prefix.lastObject.longValue + v.longValue)];
    }
    return self;
}
- (long)queryFrom:(NSUInteger)lo to:(NSUInteger)hi {
    return _prefix[hi].longValue - _prefix[lo].longValue;
}
@end

int main(void) {
    @autoreleasepool {
        RangeSum *rs = [[RangeSum alloc] initWithValues:@[@3, @1, @4, @1, @5, @9, @2, @6]];
        NSLog(@"%ld", [rs queryFrom:2 to:5]);
    }
    return 0;
}
