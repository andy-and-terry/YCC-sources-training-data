function maxProduct(nums) {
  let best = nums[0], hi = nums[0], lo = nums[0];
  for (const x of nums.slice(1)) {
    if (x < 0) [hi, lo] = [lo, hi];
    hi = Math.max(x, hi * x);
    lo = Math.min(x, lo * x);
    best = Math.max(best, hi);
  }
  return best;
}

console.log(maxProduct([2, 3, -2, 4]), maxProduct([-2, 0, -1]), maxProduct([-2, 3, -4]));
