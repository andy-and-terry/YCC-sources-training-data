#include <stdio.h>

int coin_change(int coins[], int n, int amount) {
    int dp[12];
    for (int i = 0; i <= amount; i++) dp[i] = amount + 1;
    dp[0] = 0;
    for (int a = 1; a <= amount; a++) {
        for (int c = 0; c < n; c++) {
            if (coins[c] <= a && dp[a - coins[c]] + 1 < dp[a]) {
                dp[a] = dp[a - coins[c]] + 1;
            }
        }
    }
    return dp[amount] > amount ? -1 : dp[amount];
}

int main(void) {
    int coins[] = {1, 2, 5};
    printf("%d\n", coin_change(coins, 3, 11));
    return 0;
}
