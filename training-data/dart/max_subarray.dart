int maxSubArray(List<int> nums) {
  var maxSoFar = nums[0];
  var maxEndingHere = nums[0];
  for (var i = 1; i < nums.length; i++) {
    maxEndingHere = [nums[i], maxEndingHere + nums[i]].reduce((a, b) => a > b ? a : b);
    maxSoFar = [maxSoFar, maxEndingHere].reduce((a, b) => a > b ? a : b);
  }
  return maxSoFar;
}

void main() {
  print(maxSubArray([-2, 1, -3, 4, -1, 2, 1, -5, 4]));
}
