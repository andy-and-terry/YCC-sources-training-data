#import <Foundation/Foundation.h>

NSArray<NSString *> *breadthFirstSearch(NSDictionary<NSString *, NSArray<NSString *> *> *graph, NSString *start) {
    NSMutableArray<NSString *> *order = [NSMutableArray array];
    NSMutableSet<NSString *> *visited = [NSMutableSet setWithObject:start];
    NSMutableArray<NSString *> *queue = [NSMutableArray arrayWithObject:start];

    while (queue.count > 0) {
        NSString *node = queue[0];
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

void depthFirstSearchHelper(NSDictionary<NSString *, NSArray<NSString *> *> *graph, NSString *node,
                             NSMutableSet<NSString *> *visited, NSMutableArray<NSString *> *order) {
    if ([visited containsObject:node]) return;
    [visited addObject:node];
    [order addObject:node];
    for (NSString *neighbor in graph[node]) {
        depthFirstSearchHelper(graph, neighbor, visited, order);
    }
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSDictionary<NSString *, NSArray<NSString *> *> *graph = @{
            @"a": @[ @"b", @"c" ],
            @"b": @[ @"a", @"d" ],
            @"c": @[ @"a", @"d" ],
            @"d": @[ @"b", @"c", @"e" ],
            @"e": @[ @"d" ]
        };

        NSLog(@"BFS: %@", breadthFirstSearch(graph, @"a"));

        NSMutableArray<NSString *> *dfsOrder = [NSMutableArray array];
        depthFirstSearchHelper(graph, @"a", [NSMutableSet set], dfsOrder);
        NSLog(@"DFS: %@", dfsOrder);
    }
    return 0;
}
