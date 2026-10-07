#import <Foundation/Foundation.h>

// The flyweight pattern shares a single object for identical "intrinsic"
// state instead of allocating a new one every time, which matters when
// there are many objects but few distinct variants. Here every tree of
// the same species shares one TreeType object; only the per-tree
// position is stored separately as "extrinsic" state.
@interface TreeType : NSObject
@property (nonatomic, copy, readonly) NSString *species;
@property (nonatomic, copy, readonly) NSString *color;
- (instancetype)initWithSpecies:(NSString *)species color:(NSString *)color;
- (void)renderAtX:(double)x y:(double)y;
@end

@implementation TreeType
- (instancetype)initWithSpecies:(NSString *)species color:(NSString *)color {
    self = [super init];
    if (self) {
        _species = [species copy];
        _color = [color copy];
    }
    return self;
}

- (void)renderAtX:(double)x y:(double)y {
    NSLog(@"drawing %@ %@ tree at (%.1f, %.1f)", self.color, self.species, x, y);
}
@end

// The factory guarantees each distinct species/color combination is only
// ever built once, handing out the same shared instance thereafter.
@interface TreeTypeFactory : NSObject
+ (TreeType *)treeTypeForSpecies:(NSString *)species color:(NSString *)color;
@end

@implementation TreeTypeFactory
+ (NSMutableDictionary<NSString *, TreeType *> *)cache {
    static NSMutableDictionary *cache = nil;
    if (!cache) cache = [NSMutableDictionary dictionary];
    return cache;
}

+ (TreeType *)treeTypeForSpecies:(NSString *)species color:(NSString *)color {
    NSString *key = [NSString stringWithFormat:@"%@-%@", species, color];
    NSMutableDictionary *cache = [self cache];
    TreeType *existing = cache[key];
    if (existing) return existing;
    TreeType *created = [[TreeType alloc] initWithSpecies:species color:color];
    cache[key] = created;
    return created;
}
@end

@interface Tree : NSObject
@property (nonatomic) double x;
@property (nonatomic) double y;
@property (nonatomic, strong) TreeType *type;
- (void)render;
@end

@implementation Tree
- (void)render {
    [self.type renderAtX:self.x y:self.y];
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSMutableArray<Tree *> *forest = [NSMutableArray array];
        NSArray *positions = @[ @[@1.0, @2.0], @[@3.0, @4.0], @[@5.0, @1.0] ];
        for (NSArray *pos in positions) {
            Tree *tree = [[Tree alloc] init];
            tree.x = [pos[0] doubleValue];
            tree.y = [pos[1] doubleValue];
            tree.type = [TreeTypeFactory treeTypeForSpecies:@"Oak" color:@"Green"];
            [forest addObject:tree];
        }
        for (Tree *tree in forest) [tree render];

        TreeType *a = [TreeTypeFactory treeTypeForSpecies:@"Oak" color:@"Green"];
        TreeType *b = [TreeTypeFactory treeTypeForSpecies:@"Oak" color:@"Green"];
        NSLog(@"shared flyweight instance: %d", a == b);
    }
    return 0;
}
