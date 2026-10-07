#import <Foundation/Foundation.h>

// Kruskal's algorithm: sort edges by weight and greedily add each one
// that connects two different union-find components.
@interface UnionFind : NSObject
- (instancetype)initWithSize:(NSInteger)size;
- (NSInteger)find:(NSInteger)x;
- (BOOL)unionSets:(NSInteger)x with:(NSInteger)y;
@end

@implementation UnionFind {
    NSMutableArray<NSNumber *> *_parent;
}
- (instancetype)initWithSize:(NSInteger)size {
    self = [super init];
    if (self) {
        _parent = [NSMutableArray arrayWithCapacity:size];
        for (NSInteger i = 0; i < size; i++) [_parent addObject:@(i)];
    }
    return self;
}
- (NSInteger)find:(NSInteger)x {
    if ([_parent[x] integerValue] != x) {
        _parent[x] = @([self find:[_parent[x] integerValue]]);
    }
    return [_parent[x] integerValue];
}
- (BOOL)unionSets:(NSInteger)x with:(NSInteger)y {
    NSInteger rootX = [self find:x];
    NSInteger rootY = [self find:y];
    if (rootX == rootY) return NO;
    _parent[rootX] = @(rootY);
    return YES;
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray *edges = @[
            @[ @0, @1, @4 ],
            @[ @0, @2, @1 ],
            @[ @2, @1, @2 ],
            @[ @1, @3, @5 ],
            @[ @2, @3, @8 ]
        ];
        NSArray *sorted = [edges sortedArrayUsingComparator:^NSComparisonResult(NSArray *a, NSArray *b) {
            return [a[2] compare:b[2]];
        }];

        UnionFind *uf = [[UnionFind alloc] initWithSize:4];
        NSInteger total = 0;
        for (NSArray *edge in sorted) {
            NSInteger from = [edge[0] integerValue];
            NSInteger to = [edge[1] integerValue];
            NSInteger weight = [edge[2] integerValue];
            if ([uf unionSets:from with:to]) {
                total += weight;
                NSLog(@"%ld - %ld : %ld", (long)from, (long)to, (long)weight);
            }
        }
        NSLog(@"total: %ld", (long)total);
    }
    return 0;
}
