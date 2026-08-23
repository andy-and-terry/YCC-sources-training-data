#include <stdio.h>

int knapsack(int weights[], int values[], int n, int capacity) {
    int dp[5][8] = {0};
    for (int i = 1; i <= n; i++) {
        for (int w = 0; w <= capacity; w++) {
            if (weights[i - 1] <= w) {
                int take = values[i - 1] + dp[i - 1][w - weights[i - 1]];
                int skip = dp[i - 1][w];
                dp[i][w] = take > skip ? take : skip;
            } else {
                dp[i][w] = dp[i - 1][w];
            }
        }
    }
    return dp[n][capacity];
}

int main(void) {
    int weights[] = {1, 3, 4, 5};
    int values[] = {1, 4, 5, 7};
    printf("%d\n", knapsack(weights, values, 4, 7));
    return 0;
}
