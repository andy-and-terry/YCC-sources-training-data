#import <Foundation/Foundation.h>

NSDictionary *dijkstra(NSDictionary *graph, NSString *source) {
    NSMutableDictionary *dist = [NSMutableDictionary dictionary];
    for (NSString *node in graph) dist[node] = @(NSIntegerMax);
    dist[source] = @0;
    NSMutableSet *visited = [NSMutableSet set];

    for (NSUInteger iter = 0; iter < graph.count; iter++) {
        NSString *bestNode = nil;
        NSInteger bestDist = NSIntegerMax;
        for (NSString *node in dist) {
            if (![visited containsObject:node] && [dist[node] integerValue] < bestDist) {
                bestNode = node;
                bestDist = [dist[node] integerValue];
            }
        }
        if (!bestNode) break;
        [visited addObject:bestNode];
        for (NSArray *edge in graph[bestNode]) {
            NSString *neighbor = edge[0];
            NSInteger weight = [edge[1] integerValue];
            NSInteger newDist = bestDist + weight;
            if (newDist < [dist[neighbor] integerValue]) {
                dist[neighbor] = @(newDist);
            }
        }
    }
    return dist;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSDictionary *graph = @{
            @"a": @[ @[@"b", @1], @[@"c", @4] ],
            @"b": @[ @[@"c", @2], @[@"d", @5] ],
            @"c": @[ @[@"d", @1] ],
            @"d": @[]
        };
        NSLog(@"%@", dijkstra(graph, @"a"));
    }
    return 0;
}
