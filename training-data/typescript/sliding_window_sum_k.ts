function maxSumOfSize(nums: number[], k: number): number {
  if (k <= 0 || k > nums.length) throw new RangeError("invalid window size");
  let window = 0;
  for (let i = 0; i < k; i++) window += nums[i];
  let best = window;
  for (let i = k; i < nums.length; i++) {
    window += nums[i] - nums[i - k];
    if (window > best) best = window;
  }
  return best;
}

console.log(maxSumOfSize([2, 1, 5, 1, 3, 2], 3));
console.log(maxSumOfSize([-1, -2, -3, -4], 2));
