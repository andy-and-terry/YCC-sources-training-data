#include <stdio.h>

#define R 3
#define C 3

unsigned long long paths(int g[R][C]) {
    unsigned long long dp[C] = {0};
    dp[0] = g[0][0] == 0;
    for (int r = 0; r < R; r++)
        for (int c = 0; c < C; c++) {
            if (g[r][c]) dp[c] = 0;
            else if (c > 0) dp[c] += dp[c - 1];
        }
    return dp[C - 1];
}

unsigned long long paths_empty(int rows, int cols) {
    unsigned long long r = 1;
    int n = rows + cols - 2, k = rows - 1 < cols - 1 ? rows - 1 : cols - 1;
    for (int i = 1; i <= k; i++) r = r * (unsigned long long)(n - k + i) / (unsigned long long)i;
    return r;
}

int main(void) {
    int g[R][C] = {{0, 0, 0}, {0, 1, 0}, {0, 0, 0}};
    printf("%llu %llu %llu\n", paths(g), paths_empty(3, 7), paths_empty(18, 18));
    return 0;
}
