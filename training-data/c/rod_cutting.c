#include <stdio.h>

int max_int(int a, int b) {
    return a > b ? a : b;
}

int rod_cutting(int price[], int n) {
    int dp[n + 1];
    dp[0] = 0;

    for (int len = 1; len <= n; len++) {
        int best = -1;
        for (int cut = 1; cut <= len; cut++) {
            best = max_int(best, price[cut - 1] + dp[len - cut]);
        }
        dp[len] = best;
    }
    return dp[n];
}

int main(void) {
    int price[] = {1, 5, 8, 9, 10, 17, 17, 20};
    int n = sizeof(price) / sizeof(price[0]);

    printf("%d\n", rod_cutting(price, n));
    return 0;
}
