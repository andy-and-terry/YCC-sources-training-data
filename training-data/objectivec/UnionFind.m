#import <Foundation/Foundation.h>

@interface UnionFind : NSObject
@property (nonatomic, strong) NSMutableArray<NSNumber *> *parent;
- (instancetype)initWithSize:(NSInteger)n;
- (NSInteger)find:(NSInteger)x;
- (void)union:(NSInteger)x with:(NSInteger)y;
@end

@implementation UnionFind
- (instancetype)initWithSize:(NSInteger)n {
    self = [super init];
    if (self) {
        _parent = [NSMutableArray array];
        for (NSInteger i = 0; i < n; i++) [_parent addObject:@(i)];
    }
    return self;
}
- (NSInteger)find:(NSInteger)x {
    if ([self.parent[x] integerValue] == x) return x;
    return [self find:[self.parent[x] integerValue]];
}
- (void)union:(NSInteger)x with:(NSInteger)y {
    NSInteger rootX = [self find:x];
    NSInteger rootY = [self find:y];
    if (rootX != rootY) self.parent[rootX] = @(rootY);
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        UnionFind *uf = [[UnionFind alloc] initWithSize:5];
        [uf union:0 with:1];
        [uf union:1 with:2];
        NSLog(@"%d", [uf find:0] == [uf find:2]);
        NSLog(@"%d", [uf find:0] == [uf find:3]);
    }
    return 0;
}
