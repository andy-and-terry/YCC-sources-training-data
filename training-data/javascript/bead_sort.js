// Bead (gravity) sort for non-negative integers.
function beadSort(nums) {
  const cols = new Array(Math.max(...nums)).fill(0);
  for (const n of nums) for (let i = 0; i < n; i++) cols[i]++;
  const rows = nums.map((_, r) => cols.filter((c) => c > r).length);
  return rows.reverse();
}
console.log(beadSort([5, 3, 1, 4, 2]));
