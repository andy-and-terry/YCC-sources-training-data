#include <stdio.h>

#define N 4

static const int dr[] = {1, 0, 0, -1}, dc[] = {0, -1, 1, 0};
static const char names[] = "DLRU";

static void solve(int maze[N][N], int r, int c, int seen[N][N], char *path, int depth, int *count) {
    if (r == N - 1 && c == N - 1) {
        path[depth] = '\0';
        printf("%s\n", path);
        (*count)++;
        return;
    }
    seen[r][c] = 1;
    for (int k = 0; k < 4; k++) {
        int nr = r + dr[k], nc = c + dc[k];
        if (nr >= 0 && nr < N && nc >= 0 && nc < N && maze[nr][nc] && !seen[nr][nc]) {
            path[depth] = names[k];
            solve(maze, nr, nc, seen, path, depth + 1, count);
        }
    }
    seen[r][c] = 0;
}

int main(void) {
    int maze[N][N] = {{1, 0, 0, 0}, {1, 1, 0, 1}, {1, 1, 0, 0}, {0, 1, 1, 1}};
    int seen[N][N] = {{0}}, count = 0;
    char path[N * N + 1];
    if (maze[0][0]) solve(maze, 0, 0, seen, path, 0, &count);
    printf("%d paths\n", count);
    return 0;
}
