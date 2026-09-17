bool has_subset_sum(int[] nums, int target) {
    bool[] dp = new bool[target + 1];
    dp[0] = true;

    foreach (int num in nums) {
        for (int t = target; t >= num; t--) {
            if (dp[t - num]) {
                dp[t] = true;
            }
        }
    }
    return dp[target];
}

void main() {
    int[] nums = { 3, 34, 4, 12, 5, 2 };
    stdout.printf("%s\n", has_subset_sum(nums, 9).to_string());

    int[] nums2 = { 1, 2, 5 };
    stdout.printf("%s\n", has_subset_sum(nums2, 4).to_string());
}
