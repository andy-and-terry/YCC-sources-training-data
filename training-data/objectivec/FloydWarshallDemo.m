#import <Foundation/Foundation.h>

// Floyd-Warshall computes all-pairs shortest paths by considering every
// node k as a possible waypoint between every pair (i, j).
#define INF (NSIntegerMax / 2)

void floydWarshall(NSInteger n, NSInteger dist[n][n]) {
    for (NSInteger k = 0; k < n; k++) {
        for (NSInteger i = 0; i < n; i++) {
            for (NSInteger j = 0; j < n; j++) {
                if (dist[i][k] + dist[k][j] < dist[i][j]) {
                    dist[i][j] = dist[i][k] + dist[k][j];
                }
            }
        }
    }
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        const NSInteger n = 4;
        NSInteger dist[4][4] = {
            { 0,   3,   INF, INF },
            { INF, 0,   1,   INF },
            { INF, INF, 0,   7   },
            { 2,   INF, INF, 0   }
        };

        floydWarshall(n, dist);

        for (NSInteger i = 0; i < n; i++) {
            NSMutableArray *row = [NSMutableArray array];
            for (NSInteger j = 0; j < n; j++) {
                [row addObject:@(dist[i][j])];
            }
            NSLog(@"%@", row);
        }
    }
    return 0;
}
