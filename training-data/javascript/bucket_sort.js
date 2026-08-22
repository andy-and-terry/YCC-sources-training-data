function bucketSort(items, bucketCount = 10) {
  if (items.length === 0) return [];
  const lo = Math.min(...items);
  const hi = Math.max(...items);
  const span = hi - lo || 1;
  const buckets = Array.from({ length: bucketCount }, () => []);
  for (const x of items) {
    const idx = Math.min(bucketCount - 1, Math.floor(((x - lo) / span) * bucketCount));
    buckets[idx].push(x);
  }
  return buckets.flatMap((bucket) => bucket.sort((a, b) => a - b));
}

console.log(bucketSort([0.42, 0.32, 0.23, 0.52, 0.25, 0.47, 0.51]));
module.exports = { bucketSort };
