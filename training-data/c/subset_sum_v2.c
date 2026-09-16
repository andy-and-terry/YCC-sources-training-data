#include <stdbool.h>
#include <stdio.h>

bool subset_sum(int arr[], int n, int target) {
    bool dp[n + 1][target + 1];
    for (int i = 0; i <= n; i++) dp[i][0] = true;
    for (int j = 1; j <= target; j++) dp[0][j] = false;

    for (int i = 1; i <= n; i++) {
        for (int j = 1; j <= target; j++) {
            dp[i][j] = dp[i - 1][j];
            if (arr[i - 1] <= j) dp[i][j] = dp[i][j] || dp[i - 1][j - arr[i - 1]];
        }
    }
    return dp[n][target];
}

int main(void) {
    int arr[] = {3, 34, 4, 12, 5, 2};
    int n = sizeof(arr) / sizeof(arr[0]);
    printf("%d\n", subset_sum(arr, n, 9));
    printf("%d\n", subset_sum(arr, n, 10));
    printf("%d\n", subset_sum(arr, n, 21));
    return 0;
}
