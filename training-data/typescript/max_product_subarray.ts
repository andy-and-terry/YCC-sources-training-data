export function maxProduct(nums: readonly number[]): number {
  if (nums.length === 0) throw new Error("empty input");
  let best = nums[0], hi = nums[0], lo = nums[0];
  for (const x of nums.slice(1)) {
    const candidates = [x, hi * x, lo * x];
    hi = Math.max(...candidates);
    lo = Math.min(...candidates);
    best = Math.max(best, hi);
  }
  return best;
}

console.log(maxProduct([2, 3, -2, 4]), maxProduct([-2, 3, -4]));
