#include <stdio.h>

int main(void) {
    int t[4][4] = {{2}, {3, 4}, {6, 5, 7}, {4, 1, 8, 3}};
    int dp[4];
    for (int i = 0; i < 4; i++) dp[i] = t[3][i];
    for (int r = 2; r >= 0; r--)
        for (int i = 0; i <= r; i++) {
            int m = dp[i] < dp[i + 1] ? dp[i] : dp[i + 1];
            dp[i] = t[r][i] + m;
        }
    printf("%d\n", dp[0]); /* 11 */
    return 0;
}
