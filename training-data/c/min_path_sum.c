#include <stdio.h>

#define R 3
#define C 3

int min_path_sum(const int g[R][C]) {
    int dp[R][C];
    for (int r = 0; r < R; r++)
        for (int c = 0; c < C; c++) {
            if (r == 0 && c == 0) dp[r][c] = g[r][c];
            else if (r == 0) dp[r][c] = dp[r][c - 1] + g[r][c];
            else if (c == 0) dp[r][c] = dp[r - 1][c] + g[r][c];
            else dp[r][c] = (dp[r - 1][c] < dp[r][c - 1] ? dp[r - 1][c] : dp[r][c - 1]) + g[r][c];
        }
    int r = R - 1, c = C - 1;
    printf("path (reversed):");
    while (r || c) {
        printf(" (%d,%d)", r, c);
        if (r == 0 || (c > 0 && dp[r][c - 1] < dp[r - 1][c])) c--;
        else r--;
    }
    printf(" (0,0)\n");
    return dp[R - 1][C - 1];
}

int main(void) {
    const int g[R][C] = {{1, 3, 1}, {1, 5, 1}, {4, 2, 1}};
    printf("cost %d\n", min_path_sum(g));
    return 0;
}
