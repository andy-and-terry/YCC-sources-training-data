function equilibriumIndex(nums: number[]): number {
  const total = nums.reduce((a, b) => a + b, 0);
  let left = 0;
  for (let i = 0; i < nums.length; i++) {
    if (left === total - left - nums[i]) return i;
    left += nums[i];
  }
  return -1;
}

console.log(equilibriumIndex([1, 7, 3, 6, 5, 6])); // 3
