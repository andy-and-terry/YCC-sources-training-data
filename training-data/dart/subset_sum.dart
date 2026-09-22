bool hasSubsetSum(List<int> nums, int target) {
  final dp = List<bool>.filled(target + 1, false);
  dp[0] = true;

  for (final num in nums) {
    for (var sum = target; sum >= num; sum--) {
      if (dp[sum - num]) dp[sum] = true;
    }
  }

  return dp[target];
}

void main() {
  final nums = [3, 34, 4, 12, 5, 2];
  print(hasSubsetSum(nums, 9));
  print(hasSubsetSum(nums, 10));
  print(hasSubsetSum(nums, 21));
}
