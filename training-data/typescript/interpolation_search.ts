export function interpolationSearch(a: readonly number[], target: number): number {
  let lo = 0, hi = a.length - 1;
  while (lo <= hi && target >= a[lo] && target <= a[hi]) {
    if (a[hi] === a[lo]) return a[lo] === target ? lo : -1;
    const pos = lo + Math.floor(((target - a[lo]) * (hi - lo)) / (a[hi] - a[lo]));
    if (a[pos] === target) return pos;
    if (a[pos] < target) lo = pos + 1;
    else hi = pos - 1;
  }
  return -1;
}

const data = [10, 12, 13, 16, 18, 19, 20, 21, 22, 23, 24, 33, 35, 42, 47];
console.log(interpolationSearch(data, 18), interpolationSearch(data, 25));
