#include <limits.h>
#include <stdio.h>

/* dims has n+1 entries: matrix i has dimensions dims[i-1] x dims[i]. */
int matrix_chain_order(int dims[], int n) {
    int dp[n][n];

    for (int i = 1; i < n; i++) dp[i][i] = 0;

    for (int len = 2; len < n; len++) {
        for (int i = 1; i <= n - len; i++) {
            int j = i + len - 1;
            dp[i][j] = INT_MAX;
            for (int k = i; k < j; k++) {
                int cost = dp[i][k] + dp[k + 1][j] + dims[i - 1] * dims[k] * dims[j];
                if (cost < dp[i][j]) dp[i][j] = cost;
            }
        }
    }
    return dp[1][n - 1];
}

int main(void) {
    /* Matrices: 40x20, 20x30, 30x10, 10x30 -> dims = {40,20,30,10,30} */
    int dims[] = {40, 20, 30, 10, 30};
    int n = sizeof(dims) / sizeof(dims[0]);

    printf("minimum multiplication cost: %d\n", matrix_chain_order(dims, n));
    return 0;
}
