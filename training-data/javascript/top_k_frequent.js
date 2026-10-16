function topKFrequent(nums, k) {
  const freq = new Map();
  for (const n of nums) freq.set(n, (freq.get(n) || 0) + 1);

  const buckets = Array.from({ length: nums.length + 1 }, () => []);
  for (const [n, f] of freq) buckets[f].push(n);

  const result = [];
  for (let f = buckets.length - 1; f > 0 && result.length < k; f--) {
    result.push(...buckets[f]);
  }
  return result.slice(0, k);
}

console.log(topKFrequent([1, 1, 1, 2, 2, 3], 2));
console.log(topKFrequent([4, 4, 5, 6, 6, 6, 7], 1));
console.log(topKFrequent([1], 1));
