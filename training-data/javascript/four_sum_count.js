function fourSumCount(a, b, c, d) {
  const sums = new Map();
  for (const x of a) for (const y of b) sums.set(x + y, (sums.get(x + y) || 0) + 1);
  let count = 0;
  for (const x of c) for (const y of d) count += sums.get(-(x + y)) || 0;
  return count;
}

console.log(fourSumCount([1, 2], [-2, -1], [-1, 2], [0, 2])); // 2
