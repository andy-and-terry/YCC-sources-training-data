function hasSubsetSum(nums, target) {
  const n = nums.length;
  const dp = Array.from({ length: n + 1 }, () => new Array(target + 1).fill(false));
  for (let i = 0; i <= n; i++) dp[i][0] = true;
  for (let i = 1; i <= n; i++) {
    for (let t = 1; t <= target; t++) {
      dp[i][t] = dp[i - 1][t];
      if (nums[i - 1] <= t) dp[i][t] = dp[i][t] || dp[i - 1][t - nums[i - 1]];
    }
  }
  return dp[n][target];
}

console.log(hasSubsetSum([3, 34, 4, 12, 5, 2], 9));
module.exports = { hasSubsetSum };
