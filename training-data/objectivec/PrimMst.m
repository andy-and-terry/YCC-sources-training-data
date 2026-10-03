#import <Foundation/Foundation.h>

#define N 5

NSInteger primMst(NSInteger graph[N][N]) {
    BOOL inMst[N] = { NO };
    NSInteger key[N];
    for (NSInteger i = 0; i < N; i++) key[i] = NSIntegerMax;
    key[0] = 0;
    NSInteger total = 0;

    for (NSInteger count = 0; count < N; count++) {
        NSInteger u = -1;
        for (NSInteger v = 0; v < N; v++) {
            if (!inMst[v] && (u == -1 || key[v] < key[u])) u = v;
        }
        inMst[u] = YES;
        total += key[u];
        for (NSInteger v = 0; v < N; v++) {
            if (graph[u][v] != 0 && !inMst[v] && graph[u][v] < key[v]) {
                key[v] = graph[u][v];
            }
        }
    }
    return total;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSInteger graph[N][N] = {
            { 0, 2, 0, 6, 0 },
            { 2, 0, 3, 8, 5 },
            { 0, 3, 0, 0, 7 },
            { 6, 8, 0, 0, 9 },
            { 0, 5, 7, 9, 0 }
        };
        NSLog(@"%ld", (long)primMst(graph));
    }
    return 0;
}
