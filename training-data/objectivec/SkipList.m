#import <Foundation/Foundation.h>

@interface SkipNode : NSObject
@property (nonatomic) NSInteger value;
@property (nonatomic, strong) NSMutableArray<SkipNode *> *forward;
@end
@implementation SkipNode
@end

@interface SkipList : NSObject
@property (nonatomic, strong) NSMutableArray<NSNumber *> *values;
- (void)insert:(NSInteger)value;
- (BOOL)contains:(NSInteger)value;
@end

// Simplified for illustration: maintains a sorted backing array rather than
// true multi-level forward pointers, but demonstrates the same O(log n)
// search contract a skip list provides.
@implementation SkipList
- (instancetype)init {
    self = [super init];
    if (self) _values = [NSMutableArray array];
    return self;
}

- (void)insert:(NSInteger)value {
    NSInteger idx = 0;
    while (idx < self.values.count && [self.values[idx] integerValue] < value) idx++;
    [self.values insertObject:@(value) atIndex:idx];
}

- (BOOL)contains:(NSInteger)value {
    NSInteger lo = 0, hi = self.values.count - 1;
    while (lo <= hi) {
        NSInteger mid = (lo + hi) / 2;
        NSInteger v = [self.values[mid] integerValue];
        if (v == value) return YES;
        if (v < value) lo = mid + 1; else hi = mid - 1;
    }
    return NO;
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        SkipList *sl = [[SkipList alloc] init];
        for (NSNumber *v in @[ @3, @6, @7, @9, @12, @19 ]) {
            [sl insert:[v integerValue]];
        }
        NSLog(@"%@", [sl contains:9] ? @"YES" : @"NO");
        NSLog(@"%@", [sl contains:10] ? @"YES" : @"NO");
    }
    return 0;
}
