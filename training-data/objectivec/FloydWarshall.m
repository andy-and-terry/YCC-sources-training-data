#import <Foundation/Foundation.h>

#define INF 1000000

void floydWarshall(NSInteger dist[5][5], NSInteger n) {
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
        NSInteger n = 5;
        NSInteger dist[5][5] = {
            { 0, 3, INF, 7, INF },
            { 8, 0, 2, INF, INF },
            { 5, INF, 0, 1, INF },
            { 2, INF, INF, 0, INF },
            { INF, INF, INF, 4, 0 }
        };
        floydWarshall(dist, n);
        for (NSInteger i = 0; i < n; i++) {
            NSMutableString *row = [NSMutableString string];
            for (NSInteger j = 0; j < n; j++) {
                [row appendFormat:@"%ld ", (long)dist[i][j]];
            }
            NSLog(@"%@", row);
        }
    }
    return 0;
}
