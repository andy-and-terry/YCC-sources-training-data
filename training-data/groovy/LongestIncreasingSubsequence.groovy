def lisLength(List<Integer> nums) {
    if (nums.isEmpty()) return 0
    int n = nums.size()
    int[] dp = new int[n]
    Arrays.fill(dp, 1)
    for (int i = 1; i < n; i++) {
        for (int j = 0; j < i; j++) {
            if (nums[j] < nums[i] && dp[j] + 1 > dp[i]) {
                dp[i] = dp[j] + 1
            }
        }
    }
    return dp.max()
}

println lisLength([10, 9, 2, 5, 3, 7, 101, 18])
println lisLength([])
