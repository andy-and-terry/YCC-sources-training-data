function canPartition(nums) {
  const total = nums.reduce((a, b) => a + b, 0);
  if (total % 2) return false;
  const target = total / 2;
  const dp = new Array(target + 1).fill(false);
  dp[0] = true;
  for (const x of nums) for (let s = target; s >= x; s--) dp[s] ||= dp[s - x];
  return dp[target];
}

console.log(canPartition([1, 5, 11, 5]), canPartition([1, 2, 3, 5]));
module.exports = { canPartition };
