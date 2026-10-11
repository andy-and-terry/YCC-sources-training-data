#import <Foundation/Foundation.h>

@interface Grid : NSObject
- (instancetype)initWithSize:(NSUInteger)size;
- (id)objectAtIndexedSubscript:(NSUInteger)idx;
- (void)setObject:(id)obj atIndexedSubscript:(NSUInteger)idx;
- (id)objectForKeyedSubscript:(id)key;
- (void)setObject:(id)obj forKeyedSubscript:(id<NSCopying>)key;
@end

@implementation Grid {
    NSMutableArray *_cells;
    NSMutableDictionary *_labels;
}
- (instancetype)initWithSize:(NSUInteger)size {
    if ((self = [super init])) {
        _cells = [NSMutableArray array];
        for (NSUInteger i = 0; i < size; i++) [_cells addObject:@0];
        _labels = [NSMutableDictionary dictionary];
    }
    return self;
}
- (id)objectAtIndexedSubscript:(NSUInteger)idx { return _cells[idx]; }
- (void)setObject:(id)obj atIndexedSubscript:(NSUInteger)idx { _cells[idx] = obj; }
- (id)objectForKeyedSubscript:(id)key { return _labels[key]; }
- (void)setObject:(id)obj forKeyedSubscript:(id<NSCopying>)key { _labels[key] = obj; }
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        Grid *g = [[Grid alloc] initWithSize:3];
        g[1] = @99;
        g[@"title"] = @"my grid";
        NSLog(@"g[0]=%@ g[1]=%@", g[0], g[1]);
        NSLog(@"title=%@", g[@"title"]);
    }
    return 0;
}
