function upperBound(a, x) {
  let lo = 0, hi = a.length;
  while (lo < hi) {
    const mid = (lo + hi) >> 1;
    if (a[mid] <= x) lo = mid + 1;
    else hi = mid;
  }
  return lo;
}

function binaryInsertionSort(items) {
  const out = [];
  for (const x of items) out.splice(upperBound(out, x), 0, x);
  return out;
}

console.log(binaryInsertionSort([37, 23, 0, 17, 12, 72, 31, 46, 100, 88, 54]));
module.exports = { binaryInsertionSort };
