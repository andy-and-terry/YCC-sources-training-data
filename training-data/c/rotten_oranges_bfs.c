#include <stdio.h>
#include <string.h>

#define R 3
#define C 3

int minutes_to_rot(int in[R][C]) {
    int g[R][C], q[R * C][2], head = 0, tail = 0, fresh = 0;
    memcpy(g, in, sizeof g);
    for (int r = 0; r < R; r++)
        for (int c = 0; c < C; c++) {
            if (g[r][c] == 2) { q[tail][0] = r; q[tail][1] = c; tail++; }
            else if (g[r][c] == 1) fresh++;
        }
    static const int dr[] = {1, -1, 0, 0}, dc[] = {0, 0, 1, -1};
    int minutes = 0;
    while (head < tail && fresh) {
        int level_end = tail;
        while (head < level_end) {
            int r = q[head][0], c = q[head][1];
            head++;
            for (int k = 0; k < 4; k++) {
                int nr = r + dr[k], nc = c + dc[k];
                if (nr >= 0 && nr < R && nc >= 0 && nc < C && g[nr][nc] == 1) {
                    g[nr][nc] = 2;
                    fresh--;
                    q[tail][0] = nr;
                    q[tail][1] = nc;
                    tail++;
                }
            }
        }
        minutes++;
    }
    return fresh ? -1 : minutes;
}

int main(void) {
    int a[R][C] = {{2, 1, 1}, {1, 1, 0}, {0, 1, 1}};
    int b[R][C] = {{2, 1, 1}, {0, 1, 1}, {1, 0, 1}};
    printf("%d %d\n", minutes_to_rot(a), minutes_to_rot(b));
    return 0;
}
