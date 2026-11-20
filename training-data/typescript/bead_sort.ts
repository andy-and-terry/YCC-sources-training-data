// Bead (gravity) sort for non-negative integers.
function beadSort(nums: number[]): number[] {
  const cols: number[] = new Array(Math.max(...nums)).fill(0);
  for (const n of nums) for (let i = 0; i < n; i++) cols[i]++;
  return nums.map((_, r) => cols.filter((c) => c > r).length).reverse();
}
console.log(beadSort([5, 3, 1, 4, 2]));
