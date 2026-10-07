export function productExceptSelf(nums: readonly number[]): number[] {
  const n = nums.length;
  const out = new Array<number>(n).fill(1);
  for (let i = 1; i < n; i++) out[i] = out[i - 1] * nums[i - 1];
  let suffix = 1;
  for (let i = n - 1; i >= 0; i--) {
    out[i] = out[i] * suffix || 0; // avoid -0
    suffix *= nums[i];
  }
  return out;
}

console.log(productExceptSelf([1, 2, 3, 4]), productExceptSelf([-1, 1, 0, -3, 3]));
