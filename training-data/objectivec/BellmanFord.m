#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray<NSString *> *vertices = @[ @"a", @"b", @"c", @"d" ];
        NSArray<NSArray *> *edges = @[
            @[ @"a", @"b", @4 ],
            @[ @"a", @"c", @5 ],
            @[ @"b", @"c", @-3 ],
            @[ @"c", @"d", @4 ],
            @[ @"b", @"d", @6 ]
        ];

        NSMutableDictionary<NSString *, NSNumber *> *dist = [NSMutableDictionary dictionary];
        for (NSString *v in vertices) dist[v] = @(NSIntegerMax);
        dist[@"a"] = @0;

        for (NSInteger i = 0; i < vertices.count - 1; i++) {
            for (NSArray *edge in edges) {
                NSString *u = edge[0];
                NSString *v = edge[1];
                NSInteger w = [edge[2] integerValue];
                if ([dist[u] integerValue] != NSIntegerMax && [dist[u] integerValue] + w < [dist[v] integerValue]) {
                    dist[v] = @([dist[u] integerValue] + w);
                }
            }
        }

        BOOL hasNegativeCycle = NO;
        for (NSArray *edge in edges) {
            NSString *u = edge[0];
            NSString *v = edge[1];
            NSInteger w = [edge[2] integerValue];
            if ([dist[u] integerValue] != NSIntegerMax && [dist[u] integerValue] + w < [dist[v] integerValue]) {
                hasNegativeCycle = YES;
            }
        }

        NSLog(@"%@", dist);
        NSLog(@"negative cycle: %@", hasNegativeCycle ? @"YES" : @"NO");
    }
    return 0;
}
