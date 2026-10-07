#import <Foundation/Foundation.h>

@interface Edge : NSObject
@property (nonatomic) NSInteger u, v, weight;
@end
@implementation Edge
@end

@interface DisjointSet : NSObject
@property (nonatomic, strong) NSMutableArray<NSNumber *> *parent;
- (instancetype)initWithSize:(NSInteger)n;
- (NSInteger)find:(NSInteger)x;
- (BOOL)unionSets:(NSInteger)a with:(NSInteger)b;
@end

@implementation DisjointSet
- (instancetype)initWithSize:(NSInteger)n {
    self = [super init];
    if (self) {
        _parent = [NSMutableArray arrayWithCapacity:n];
        for (NSInteger i = 0; i < n; i++) [_parent addObject:@(i)];
    }
    return self;
}
- (NSInteger)find:(NSInteger)x {
    if ([self.parent[x] integerValue] != x) {
        self.parent[x] = @([self find:[self.parent[x] integerValue]]);
    }
    return [self.parent[x] integerValue];
}
- (BOOL)unionSets:(NSInteger)a with:(NSInteger)b {
    NSInteger ra = [self find:a];
    NSInteger rb = [self find:b];
    if (ra == rb) return NO;
    self.parent[ra] = @(rb);
    return YES;
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSMutableArray<Edge *> *edges = [NSMutableArray array];
        NSArray *raw = @[ @[@0, @1, @4], @[@0, @2, @1], @[@2, @1, @2], @[@1, @3, @1], @[@2, @3, @5] ];
        for (NSArray *e in raw) {
            Edge *edge = [[Edge alloc] init];
            edge.u = [e[0] integerValue];
            edge.v = [e[1] integerValue];
            edge.weight = [e[2] integerValue];
            [edges addObject:edge];
        }
        [edges sortUsingComparator:^NSComparisonResult(Edge *a, Edge *b) {
            return [@(a.weight) compare:@(b.weight)];
        }];
        DisjointSet *ds = [[DisjointSet alloc] initWithSize:4];
        NSInteger total = 0;
        for (Edge *e in edges) {
            if ([ds unionSets:e.u with:e.v]) {
                total += e.weight;
            }
        }
        NSLog(@"%ld", (long)total);
    }
    return 0;
}
