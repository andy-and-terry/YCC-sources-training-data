// Count contiguous subarrays whose sum equals k (prefix sums + Map).
function countSubarrays(nums, k) {
  const seen = new Map([[0, 1]]);
  let total = 0, count = 0;
  for (const x of nums) {
    total += x;
    count += seen.get(total - k) ?? 0;
    seen.set(total, (seen.get(total) ?? 0) + 1);
  }
  return count;
}

console.log(countSubarrays([1, 1, 1], 2));
