#import <Foundation/Foundation.h>

// A Fenwick tree (binary indexed tree) supports prefix-sum queries and
// point updates in O(log n) time using an implicit binary structure
// stored in a flat array, indexed starting at 1 internally.
@interface FenwickTree : NSObject
@property (nonatomic, strong) NSMutableArray<NSNumber *> *tree;
@property (nonatomic) NSInteger size;
- (instancetype)initWithSize:(NSInteger)n;
- (void)addAtIndex:(NSInteger)index delta:(NSInteger)delta;
- (NSInteger)prefixSumThroughIndex:(NSInteger)index;
- (NSInteger)rangeSumFromIndex:(NSInteger)lo toIndex:(NSInteger)hi;
@end

@implementation FenwickTree
- (instancetype)initWithSize:(NSInteger)n {
    self = [super init];
    if (self) {
        _size = n;
        _tree = [NSMutableArray arrayWithCapacity:n + 1];
        for (NSInteger i = 0; i <= n; i++) [_tree addObject:@0];
    }
    return self;
}

- (void)addAtIndex:(NSInteger)index delta:(NSInteger)delta {
    for (NSInteger i = index + 1; i <= self.size; i += i & (-i)) {
        self.tree[i] = @(self.tree[i].integerValue + delta);
    }
}

- (NSInteger)prefixSumThroughIndex:(NSInteger)index {
    NSInteger sum = 0;
    for (NSInteger i = index + 1; i > 0; i -= i & (-i)) {
        sum += self.tree[i].integerValue;
    }
    return sum;
}

- (NSInteger)rangeSumFromIndex:(NSInteger)lo toIndex:(NSInteger)hi {
    if (lo == 0) return [self prefixSumThroughIndex:hi];
    return [self prefixSumThroughIndex:hi] - [self prefixSumThroughIndex:lo - 1];
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray<NSNumber *> *values = @[ @3, @2, @-1, @6, @5, @4, @-3, @3, @7, @2 ];
        FenwickTree *fenwick = [[FenwickTree alloc] initWithSize:values.count];
        for (NSInteger i = 0; i < (NSInteger)values.count; i++) {
            [fenwick addAtIndex:i delta:values[i].integerValue];
        }
        NSLog(@"prefix sum [0,4]: %ld", (long)[fenwick prefixSumThroughIndex:4]);
        NSLog(@"range sum [3,7]: %ld", (long)[fenwick rangeSumFromIndex:3 toIndex:7]);
        [fenwick addAtIndex:2 delta:10];
        NSLog(@"range sum [3,7] after update: %ld", (long)[fenwick rangeSumFromIndex:3 toIndex:7]);
        NSLog(@"prefix sum [0,2] after update: %ld", (long)[fenwick prefixSumThroughIndex:2]);
    }
    return 0;
}
