#include <stdio.h>
#include <string.h>

#define N 8

int knight_distance(int sx, int sy, int tx, int ty) {
    static const int dx[] = {1, 2, 2, 1, -1, -2, -2, -1}, dy[] = {2, 1, -1, -2, -2, -1, 1, 2};
    int dist[N][N], q[N * N][2], head = 0, tail = 0;
    memset(dist, -1, sizeof dist);
    dist[sx][sy] = 0;
    q[tail][0] = sx;
    q[tail++][1] = sy;
    while (head < tail) {
        int x = q[head][0], y = q[head++][1];
        if (x == tx && y == ty) return dist[x][y];
        for (int k = 0; k < 8; k++) {
            int nx = x + dx[k], ny = y + dy[k];
            if (nx >= 0 && nx < N && ny >= 0 && ny < N && dist[nx][ny] < 0) {
                dist[nx][ny] = dist[x][y] + 1;
                q[tail][0] = nx;
                q[tail++][1] = ny;
            }
        }
    }
    return -1;
}

int main(void) {
    printf("a1->h8: %d, a1->b2: %d\n", knight_distance(0, 0, 7, 7), knight_distance(0, 0, 1, 1));
    return 0;
}
