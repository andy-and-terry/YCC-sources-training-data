#include <stdio.h>
#include <string.h>

int max(int a, int b) { return a > b ? a : b; }

int lcs_length(const char *a, const char *b) {
    int n = strlen(a);
    int m = strlen(b);
    int dp[n + 1][m + 1];

    for (int i = 0; i <= n; i++) {
        for (int j = 0; j <= m; j++) {
            if (i == 0 || j == 0) {
                dp[i][j] = 0;
            } else if (a[i - 1] == b[j - 1]) {
                dp[i][j] = dp[i - 1][j - 1] + 1;
            } else {
                dp[i][j] = max(dp[i - 1][j], dp[i][j - 1]);
            }
        }
    }
    return dp[n][m];
}

int main(void) {
    printf("%d\n", lcs_length("ABCBDAB", "BDCABA"));
    printf("%d\n", lcs_length("AGGTAB", "GXTXAYB"));
    return 0;
}
