def hasSubsetSum(List<Integer> nums, int target) {
    int n = nums.size()
    boolean[][] dp = new boolean[n + 1][target + 1]
    for (int i = 0; i <= n; i++) dp[i][0] = true

    for (int i = 1; i <= n; i++) {
        for (int t = 1; t <= target; t++) {
            dp[i][t] = dp[i - 1][t]
            if (nums[i - 1] <= t && dp[i - 1][t - nums[i - 1]]) {
                dp[i][t] = true
            }
        }
    }
    return dp[n][target]
}

println hasSubsetSum([3, 34, 4, 12, 5, 2], 9)
println hasSubsetSum([3, 34, 4, 12, 5, 2], 10)
