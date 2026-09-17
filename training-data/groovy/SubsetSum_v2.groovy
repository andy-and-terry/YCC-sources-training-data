class SubsetSum {
    static boolean canSum(int[] nums, int target) {
        boolean[] dp = new boolean[target + 1]
        dp[0] = true
        for (int num : nums) {
            for (int t = target; t >= num; t--) {
                if (dp[t - num]) dp[t] = true
            }
        }
        return dp[target]
    }
}

def nums = [3, 34, 4, 12, 5, 2] as int[]
println SubsetSum.canSum(nums, 9)
println SubsetSum.canSum(nums, 10)
println SubsetSum.canSum(nums, 21)
