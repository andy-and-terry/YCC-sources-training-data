#include <stdio.h>

int longest_increasing_subsequence(int arr[], int n) {
    int dp[n];
    for (int i = 0; i < n; i++) dp[i] = 1;

    for (int i = 1; i < n; i++) {
        for (int j = 0; j < i; j++) {
            if (arr[j] < arr[i] && dp[j] + 1 > dp[i]) {
                dp[i] = dp[j] + 1;
            }
        }
    }

    int best = 0;
    for (int i = 0; i < n; i++) {
        if (dp[i] > best) best = dp[i];
    }
    return best;
}

int main(void) {
    int arr[] = {10, 9, 2, 5, 3, 7, 101, 18};
    int n = sizeof(arr) / sizeof(arr[0]);
    printf("%d\n", longest_increasing_subsequence(arr, n));
    return 0;
}
