#import <Foundation/Foundation.h>

// Bellman-Ford relaxes every edge |V| - 1 times, which (unlike Dijkstra)
// still works correctly with negative edge weights as long as there is
// no negative-weight cycle reachable from the source.
NSDictionary *bellmanFord(NSArray<NSString *> *nodes, NSArray<NSArray *> *edges, NSString *source) {
    NSMutableDictionary *dist = [NSMutableDictionary dictionary];
    for (NSString *node in nodes) dist[node] = @(NSIntegerMax);
    dist[source] = @0;

    for (NSUInteger i = 0; i + 1 < nodes.count; i++) {
        for (NSArray *edge in edges) {
            NSString *from = edge[0];
            NSString *to = edge[1];
            NSInteger weight = [edge[2] integerValue];
            NSInteger fromDist = [dist[from] integerValue];
            if (fromDist == NSIntegerMax) continue;
            if (fromDist + weight < [dist[to] integerValue]) {
                dist[to] = @(fromDist + weight);
            }
        }
    }
    return dist;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray<NSString *> *nodes = @[ @"a", @"b", @"c", @"d" ];
        NSArray<NSArray *> *edges = @[
            @[ @"a", @"b", @4 ],
            @[ @"a", @"c", @5 ],
            @[ @"b", @"c", @(-3) ],
            @[ @"c", @"d", @2 ],
            @[ @"b", @"d", @6 ]
        ];
        NSLog(@"%@", bellmanFord(nodes, edges, @"a"));
    }
    return 0;
}
