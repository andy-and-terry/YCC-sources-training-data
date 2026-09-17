#import <Foundation/Foundation.h>

NSArray<NSString *> *bfsTraverse(NSDictionary<NSString *, NSArray<NSString *> *> *graph, NSString *start) {
    NSMutableArray<NSString *> *order = [NSMutableArray array];
    NSMutableSet<NSString *> *visited = [NSMutableSet setWithObject:start];
    NSMutableArray<NSString *> *queue = [NSMutableArray arrayWithObject:start];
    while (queue.count > 0) {
        NSString *node = queue.firstObject;
        [queue removeObjectAtIndex:0];
        [order addObject:node];
        for (NSString *neighbor in graph[node]) {
            if (![visited containsObject:neighbor]) {
                [visited addObject:neighbor];
                [queue addObject:neighbor];
            }
        }
    }
    return order;
}

void dfsVisit(NSDictionary<NSString *, NSArray<NSString *> *> *graph, NSString *node, NSMutableSet<NSString *> *visited, NSMutableArray<NSString *> *order) {
    if ([visited containsObject:node]) return;
    [visited addObject:node];
    [order addObject:node];
    for (NSString *neighbor in graph[node]) {
        dfsVisit(graph, neighbor, visited, order);
    }
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSDictionary<NSString *, NSArray<NSString *> *> *graph = @{
            @"a": @[ @"b", @"c" ],
            @"b": @[ @"d" ],
            @"c": @[ @"d" ],
            @"d": @[ @"e" ],
            @"e": @[]
        };
        NSLog(@"bfs: %@", bfsTraverse(graph, @"a"));

        NSMutableArray<NSString *> *dfsOrder = [NSMutableArray array];
        dfsVisit(graph, @"a", [NSMutableSet set], dfsOrder);
        NSLog(@"dfs: %@", dfsOrder);
    }
    return 0;
}
