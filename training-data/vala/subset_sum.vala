bool has_subset_sum(int[] values, int target) {
    int n = values.length;
    bool[,] dp = new bool[n + 1, target + 1];
    for (int i = 0; i <= n; i++) {
        dp[i, 0] = true;
    }
    for (int i = 1; i <= n; i++) {
        for (int s = 1; s <= target; s++) {
            dp[i, s] = dp[i - 1, s];
            if (values[i - 1] <= s && dp[i - 1, s - values[i - 1]]) {
                dp[i, s] = true;
            }
        }
    }
    return dp[n, target];
}

void main() {
    int[] values = { 3, 34, 4, 12, 5, 2 };
    stdout.printf("%s\n", has_subset_sum(values, 9).to_string());
    stdout.printf("%s\n", has_subset_sum(values, 10).to_string());
}
