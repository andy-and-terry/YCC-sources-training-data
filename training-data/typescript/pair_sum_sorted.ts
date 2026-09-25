export function pairWithSum(nums: readonly number[], target: number): [number, number] | null {
  let i = 0, j = nums.length - 1;
  while (i < j) {
    const s = nums[i] + nums[j];
    if (s === target) return [i, j];
    if (s < target) i++;
    else j--;
  }
  return null;
}

console.log(pairWithSum([1, 3, 4, 6, 8, 11], 10), pairWithSum([1, 2], 9));
