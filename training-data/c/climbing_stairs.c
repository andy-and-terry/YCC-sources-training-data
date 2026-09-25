#include <stdio.h>

unsigned long long ways(int n, const int *steps, int k) {
    unsigned long long dp[100] = {1};
    for (int i = 1; i <= n; i++) {
        dp[i] = 0;
        for (int s = 0; s < k; s++)
            if (steps[s] <= i) dp[i] += dp[i - steps[s]];
    }
    return dp[n];
}

int min_cost(const int *cost, int n) {
    int a = 0, b = 0;
    for (int i = 0; i < n; i++) {
        int next = (a < b ? a : b) + cost[i];
        a = b;
        b = next;
    }
    return a < b ? a : b;
}

int main(void) {
    int s12[] = {1, 2}, s135[] = {1, 3, 5};
    for (int n = 1; n <= 10; n++) printf("%llu ", ways(n, s12, 2));
    printf("\n%llu %llu\n", ways(90, s12, 2), ways(10, s135, 3));
    int cost[] = {1, 100, 1, 1, 1, 100, 1, 1, 100, 1};
    printf("min cost %d\n", min_cost(cost, 10));
    return 0;
}
