#import <Foundation/Foundation.h>

@protocol SortStrategy <NSObject>
- (void)sort:(NSMutableArray<NSNumber *> *)items;
@end

@interface AscendingStrategy : NSObject <SortStrategy>
@end

@implementation AscendingStrategy
- (void)sort:(NSMutableArray<NSNumber *> *)items {
    [items sortUsingComparator:^NSComparisonResult(NSNumber *a, NSNumber *b) {
        return [a compare:b];
    }];
}
@end

@interface DescendingStrategy : NSObject <SortStrategy>
@end

@implementation DescendingStrategy
- (void)sort:(NSMutableArray<NSNumber *> *)items {
    [items sortUsingComparator:^NSComparisonResult(NSNumber *a, NSNumber *b) {
        return [b compare:a];
    }];
}
@end

@interface Sorter : NSObject
@property (nonatomic, strong) id<SortStrategy> strategy;
- (instancetype)initWithStrategy:(id<SortStrategy>)strategy;
- (void)sortItems:(NSMutableArray<NSNumber *> *)items;
@end

@implementation Sorter
- (instancetype)initWithStrategy:(id<SortStrategy>)strategy {
    self = [super init];
    if (self) _strategy = strategy;
    return self;
}
- (void)sortItems:(NSMutableArray<NSNumber *> *)items {
    [self.strategy sort:items];
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSMutableArray<NSNumber *> *data = [@[ @5, @2, @9, @1, @5, @6 ] mutableCopy];

        Sorter *sorter = [[Sorter alloc] initWithStrategy:[[AscendingStrategy alloc] init]];
        [sorter sortItems:data];
        NSLog(@"ascending: %@", data);

        sorter.strategy = [[DescendingStrategy alloc] init];
        [sorter sortItems:data];
        NSLog(@"descending: %@", data);
    }
    return 0;
}
