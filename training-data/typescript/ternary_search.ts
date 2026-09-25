export function ternarySearch(a: readonly number[], target: number): number {
  let lo = 0, hi = a.length - 1;
  while (lo <= hi) {
    const m1 = lo + Math.floor((hi - lo) / 3);
    const m2 = hi - Math.floor((hi - lo) / 3);
    if (a[m1] === target) return m1;
    if (a[m2] === target) return m2;
    if (target < a[m1]) hi = m1 - 1;
    else if (target > a[m2]) lo = m2 + 1;
    else { lo = m1 + 1; hi = m2 - 1; }
  }
  return -1;
}

export function unimodalMax(f: (x: number) => number, lo: number, hi: number, eps = 1e-9): number {
  while (hi - lo > eps) {
    const m1 = lo + (hi - lo) / 3;
    const m2 = hi - (hi - lo) / 3;
    if (f(m1) < f(m2)) lo = m1;
    else hi = m2;
  }
  return (lo + hi) / 2;
}

console.log(ternarySearch([1, 3, 5, 7, 9, 11, 13], 9));
console.log(unimodalMax((x) => -((x - 2) ** 2) + 3, -10, 10).toFixed(6));
