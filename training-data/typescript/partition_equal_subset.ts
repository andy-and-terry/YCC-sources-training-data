/** Returns the two halves if an equal-sum partition exists, else null. */
export function partitionEqual(nums: readonly number[]): [number[], number[]] | null {
  const total = nums.reduce((a, b) => a + b, 0);
  if (total % 2) return null;
  const target = total / 2;
  const from = new Array<number>(target + 1).fill(-1); // index of item that first reached sum
  from[0] = nums.length;
  nums.forEach((x, i) => {
    for (let s = target; s >= x; s--) if (from[s] < 0 && from[s - x] >= 0 && from[s - x] !== i) from[s] = i;
  });
  if (from[target] < 0) return null;
  const used = new Set<number>();
  for (let s = target; s > 0; s -= nums[from[s]]) used.add(from[s]);
  const a = nums.filter((_, i) => used.has(i));
  const b = nums.filter((_, i) => !used.has(i));
  return [a, b];
}

console.log(partitionEqual([1, 5, 11, 5]), partitionEqual([1, 2, 3, 5]), partitionEqual([3, 1, 1, 2, 2, 1]));
