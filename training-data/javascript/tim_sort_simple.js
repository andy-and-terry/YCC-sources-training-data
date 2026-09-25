const MIN_RUN = 32;

function insertionSort(a, lo, hi) {
  for (let i = lo + 1; i <= hi; i++) {
    const key = a[i];
    let j = i - 1;
    while (j >= lo && a[j] > key) {
      a[j + 1] = a[j];
      j--;
    }
    a[j + 1] = key;
  }
}

function merge(a, lo, mid, hi) {
  const left = a.slice(lo, mid + 1);
  const right = a.slice(mid + 1, hi + 1);
  let i = 0, j = 0, k = lo;
  while (i < left.length && j < right.length) a[k++] = left[i] <= right[j] ? left[i++] : right[j++];
  while (i < left.length) a[k++] = left[i++];
  while (j < right.length) a[k++] = right[j++];
}

function timSort(a) {
  const n = a.length;
  for (let lo = 0; lo < n; lo += MIN_RUN) insertionSort(a, lo, Math.min(lo + MIN_RUN - 1, n - 1));
  for (let size = MIN_RUN; size < n; size *= 2) {
    for (let lo = 0; lo < n; lo += 2 * size) {
      const mid = Math.min(lo + size - 1, n - 1);
      const hi = Math.min(lo + 2 * size - 1, n - 1);
      if (mid < hi) merge(a, lo, mid, hi);
    }
  }
  return a;
}

const rnd = Array.from({ length: 200 }, () => Math.floor(Math.random() * 1000));
const expected = [...rnd].sort((x, y) => x - y);
console.log("random ok:", timSort(rnd).every((v, i) => v === expected[i]));
console.log(timSort([5, 21, 7, 23, 19, 1, 0, 42]));
module.exports = { timSort };
