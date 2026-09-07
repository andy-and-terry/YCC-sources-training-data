#import <Foundation/Foundation.h>

@interface SegmentTree : NSObject
@property (nonatomic, strong) NSMutableArray<NSNumber *> *tree;
@property (nonatomic) NSInteger n;
- (instancetype)initWithValues:(NSArray<NSNumber *> *)values;
- (void)build:(NSArray<NSNumber *> *)values node:(NSInteger)node start:(NSInteger)start end:(NSInteger)end;
- (NSInteger)query:(NSInteger)node start:(NSInteger)start end:(NSInteger)end left:(NSInteger)left right:(NSInteger)right;
@end

@implementation SegmentTree
- (instancetype)initWithValues:(NSArray<NSNumber *> *)values {
    self = [super init];
    if (self) {
        _n = values.count;
        _tree = [NSMutableArray arrayWithCapacity:4 * _n];
        for (NSInteger i = 0; i < 4 * _n; i++) [_tree addObject:@0];
        [self build:values node:0 start:0 end:_n - 1];
    }
    return self;
}

- (void)build:(NSArray<NSNumber *> *)values node:(NSInteger)node start:(NSInteger)start end:(NSInteger)end {
    if (start == end) {
        self.tree[node] = values[start];
        return;
    }
    NSInteger mid = (start + end) / 2;
    [self build:values node:2 * node + 1 start:start end:mid];
    [self build:values node:2 * node + 2 start:mid + 1 end:end];
    self.tree[node] = @([self.tree[2 * node + 1] integerValue] + [self.tree[2 * node + 2] integerValue]);
}

- (NSInteger)query:(NSInteger)node start:(NSInteger)start end:(NSInteger)end left:(NSInteger)left right:(NSInteger)right {
    if (right < start || end < left) return 0;
    if (left <= start && end <= right) return [self.tree[node] integerValue];
    NSInteger mid = (start + end) / 2;
    NSInteger leftSum = [self query:2 * node + 1 start:start end:mid left:left right:right];
    NSInteger rightSum = [self query:2 * node + 2 start:mid + 1 end:end left:left right:right];
    return leftSum + rightSum;
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray<NSNumber *> *values = @[ @1, @3, @5, @7, @9, @11 ];
        SegmentTree *tree = [[SegmentTree alloc] initWithValues:values];
        NSLog(@"%ld", (long)[tree query:0 start:0 end:tree.n - 1 left:1 right:3]);
        NSLog(@"%ld", (long)[tree query:0 start:0 end:tree.n - 1 left:0 right:5]);
    }
    return 0;
}
