#import <Foundation/Foundation.h>

void visitNode(NSString *node, NSDictionary *graph, NSMutableSet *visited, NSMutableArray *order) {
    if ([visited containsObject:node]) return;
    [visited addObject:node];
    for (NSString *dep in graph[node]) {
        visitNode(dep, graph, visited, order);
    }
    [order addObject:node];
}

NSArray *topoSort(NSDictionary *graph) {
    NSMutableSet *visited = [NSMutableSet set];
    NSMutableArray *order = [NSMutableArray array];
    for (NSString *node in graph) {
        visitNode(node, graph, visited, order);
    }
    return order;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSDictionary *graph = @{ @"a": @[@"b", @"c"], @"b": @[@"d"], @"c": @[@"d"], @"d": @[] };
        NSLog(@"%@", topoSort(graph));
    }
    return 0;
}
