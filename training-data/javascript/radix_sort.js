function radixSort(items) {
  if (items.length === 0) return [];
  let arr = [...items];
  const max = Math.max(...arr);
  for (let exp = 1; Math.floor(max / exp) > 0; exp *= 10) {
    const buckets = Array.from({ length: 10 }, () => []);
    for (const x of arr) buckets[Math.floor(x / exp) % 10].push(x);
    arr = [].concat(...buckets);
  }
  return arr;
}

console.log(radixSort([170, 45, 75, 90, 802, 24, 2, 66]));
module.exports = { radixSort };
