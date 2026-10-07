function binarySearch(a, target, lo, hi) {
  while (lo <= hi) {
    const mid = (lo + hi) >> 1;
    if (a[mid] === target) return mid;
    if (a[mid] < target) lo = mid + 1;
    else hi = mid - 1;
  }
  return -1;
}

function exponentialSearch(a, target) {
  if (a.length === 0) return -1;
  if (a[0] === target) return 0;
  let bound = 1;
  while (bound < a.length && a[bound] < target) bound *= 2;
  return binarySearch(a, target, bound >> 1, Math.min(bound, a.length - 1));
}

const data = Array.from({ length: 67 }, (_, i) => i * 3);
console.log(exponentialSearch(data, 99), exponentialSearch(data, 100));
module.exports = { exponentialSearch };
