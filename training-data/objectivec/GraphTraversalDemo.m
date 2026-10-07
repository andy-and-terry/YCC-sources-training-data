#import <Foundation/Foundation.h>

// An unweighted graph stored as an adjacency list, traversed both
// breadth-first (level by level, using a queue) and depth-first (as far
// as possible along each branch, using a stack) to show how the same
// structure yields different visit orders depending on the strategy.
@interface Graph : NSObject
@property (nonatomic, strong) NSMutableDictionary<NSString *, NSMutableArray<NSString *> *> *adjacency;
- (void)addEdgeFrom:(NSString *)from to:(NSString *)to;
- (NSArray<NSString *> *)breadthFirstFrom:(NSString *)start;
- (NSArray<NSString *> *)depthFirstFrom:(NSString *)start;
@end

@implementation Graph
- (instancetype)init {
    self = [super init];
    if (self) _adjacency = [NSMutableDictionary dictionary];
    return self;
}

- (void)addEdgeFrom:(NSString *)from to:(NSString *)to {
    if (!self.adjacency[from]) self.adjacency[from] = [NSMutableArray array];
    if (!self.adjacency[to]) self.adjacency[to] = [NSMutableArray array];
    [self.adjacency[from] addObject:to];
    [self.adjacency[to] addObject:from];
}

- (NSArray<NSString *> *)breadthFirstFrom:(NSString *)start {
    NSMutableArray *order = [NSMutableArray array];
    NSMutableSet *visited = [NSMutableSet setWithObject:start];
    NSMutableArray *queue = [NSMutableArray arrayWithObject:start];
    while (queue.count > 0) {
        NSString *node = queue[0];
        [queue removeObjectAtIndex:0];
        [order addObject:node];
        for (NSString *neighbor in self.adjacency[node]) {
            if (![visited containsObject:neighbor]) {
                [visited addObject:neighbor];
                [queue addObject:neighbor];
            }
        }
    }
    return order;
}

- (NSArray<NSString *> *)depthFirstFrom:(NSString *)start {
    NSMutableArray *order = [NSMutableArray array];
    NSMutableSet *visited = [NSMutableSet set];
    NSMutableArray *stack = [NSMutableArray arrayWithObject:start];
    while (stack.count > 0) {
        NSString *node = stack.lastObject;
        [stack removeLastObject];
        if ([visited containsObject:node]) continue;
        [visited addObject:node];
        [order addObject:node];
        NSArray<NSString *> *neighbors = self.adjacency[node];
        for (NSInteger i = (NSInteger)neighbors.count - 1; i >= 0; i--) {
            if (![visited containsObject:neighbors[i]]) [stack addObject:neighbors[i]];
        }
    }
    return order;
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        Graph *graph = [[Graph alloc] init];
        [graph addEdgeFrom:@"A" to:@"B"];
        [graph addEdgeFrom:@"A" to:@"C"];
        [graph addEdgeFrom:@"B" to:@"D"];
        [graph addEdgeFrom:@"C" to:@"D"];
        [graph addEdgeFrom:@"D" to:@"E"];

        NSLog(@"BFS from A: %@", [graph breadthFirstFrom:@"A"]);
        NSLog(@"DFS from A: %@", [graph depthFirstFrom:@"A"]);
    }
    return 0;
}
