#import <Foundation/Foundation.h>

@interface MinStack : NSObject
- (void)push:(NSInteger)x;
- (NSInteger)pop;
- (NSInteger)minimum;
@end

@implementation MinStack {
    NSMutableArray<NSNumber *> *_vals;
    NSMutableArray<NSNumber *> *_mins;
}
- (instancetype)init {
    if ((self = [super init])) { _vals = [NSMutableArray array]; _mins = [NSMutableArray array]; }
    return self;
}
- (void)push:(NSInteger)x {
    NSInteger m = _mins.count ? MIN(x, _mins.lastObject.integerValue) : x;
    [_vals addObject:@(x)];
    [_mins addObject:@(m)];
}
- (NSInteger)pop {
    NSInteger v = _vals.lastObject.integerValue;
    [_vals removeLastObject]; [_mins removeLastObject];
    return v;
}
- (NSInteger)minimum { return _mins.lastObject.integerValue; }
@end

int main(void) {
    @autoreleasepool {
        MinStack *s = [MinStack new];
        for (NSNumber *v in @[@5, @3, @7, @2]) [s push:v.integerValue];
        NSLog(@"%ld", (long)[s minimum]);
        [s pop];
        NSLog(@"%ld", (long)[s minimum]);
    }
    return 0;
}
