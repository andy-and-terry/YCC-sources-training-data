#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

bool can_partition(const int *a, int n) {
    int total = 0;
    for (int i = 0; i < n; i++) total += a[i];
    if (total % 2) return false;
    int target = total / 2;
    bool *dp = calloc((size_t)target + 1, sizeof *dp);
    dp[0] = true;
    for (int i = 0; i < n; i++)
        for (int s = target; s >= a[i]; s--) dp[s] = dp[s] || dp[s - a[i]];
    bool ok = dp[target];
    free(dp);
    return ok;
}

int main(void) {
    int a[] = {1, 5, 11, 5}, b[] = {1, 2, 3, 5};
    printf("%d %d\n", can_partition(a, 4), can_partition(b, 4));
    return 0;
}
