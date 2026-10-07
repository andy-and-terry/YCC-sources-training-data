type Cmp<T> = (a: T, b: T) => number;
const MIN_RUN = 32;

function insertionSort<T>(a: T[], lo: number, hi: number, cmp: Cmp<T>): void {
  for (let i = lo + 1; i <= hi; i++) {
    const key = a[i];
    let j = i - 1;
    while (j >= lo && cmp(a[j], key) > 0) {
      a[j + 1] = a[j];
      j--;
    }
    a[j + 1] = key;
  }
}

function merge<T>(a: T[], lo: number, mid: number, hi: number, cmp: Cmp<T>): void {
  const left = a.slice(lo, mid + 1);
  const right = a.slice(mid + 1, hi + 1);
  let i = 0, j = 0, k = lo;
  while (i < left.length && j < right.length) a[k++] = cmp(left[i], right[j]) <= 0 ? left[i++] : right[j++];
  while (i < left.length) a[k++] = left[i++];
  while (j < right.length) a[k++] = right[j++];
}

export function timSort<T>(a: T[], cmp: Cmp<T>): T[] {
  const n = a.length;
  for (let lo = 0; lo < n; lo += MIN_RUN) insertionSort(a, lo, Math.min(lo + MIN_RUN - 1, n - 1), cmp);
  for (let size = MIN_RUN; size < n; size *= 2) {
    for (let lo = 0; lo < n; lo += 2 * size) {
      const mid = Math.min(lo + size - 1, n - 1);
      const hi = Math.min(lo + 2 * size - 1, n - 1);
      if (mid < hi) merge(a, lo, mid, hi, cmp);
    }
  }
  return a;
}

interface Person { name: string; age: number }
const people: Person[] = Array.from({ length: 100 }, (_, i) => ({ name: `p${i}`, age: (i * 37) % 50 }));
const sorted = timSort([...people], (x, y) => x.age - y.age);
console.log("stable & sorted:", sorted.every((p, i) => i === 0 || sorted[i - 1].age <= p.age));
console.log(timSort([5, 21, 7, 23, 19, 1, 0, 42], (x, y) => x - y));
