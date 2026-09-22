bool subset_sum(int[] nums, int target) {
    bool[] dp = new bool[target + 1];
    dp[0] = true;

    foreach (int n in nums) {
        for (int sum = target; sum >= n; sum--) {
            if (dp[sum - n]) dp[sum] = true;
        }
    }

    return dp[target];
}

void main() {
    int[] nums = { 3, 34, 4, 12, 5, 2 };
    stdout.printf("%s\n", subset_sum(nums, 9).to_string());
    stdout.printf("%s\n", subset_sum(nums, 21).to_string());
    stdout.printf("%s\n", subset_sum(nums, 32).to_string());
}
