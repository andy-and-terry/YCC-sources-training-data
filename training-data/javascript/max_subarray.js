function maxSubarray(nums) {
  let best = nums[0];
  let current = nums[0];
  for (let i = 1; i < nums.length; i++) {
    current = Math.max(nums[i], current + nums[i]);
    best = Math.max(best, current);
  }
  return best;
}

console.log(maxSubarray([-2, 1, -3, 4, -1, 2, 1, -5, 4]));
module.exports = { maxSubarray };
