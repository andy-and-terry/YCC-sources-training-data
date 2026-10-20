function pairWithSum(sorted, target) {
  let i = 0, j = sorted.length - 1;
  while (i < j) {
    const s = sorted[i] + sorted[j];
    if (s === target) return [i, j];
    s < target ? i++ : j--;
  }
  return null;
}
console.log(pairWithSum([1, 3, 4, 6, 9], 10));
