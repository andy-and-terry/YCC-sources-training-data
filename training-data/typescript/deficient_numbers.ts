function sigma(n: number): number {
  let s = 0;
  for (let d = 1; d * d <= n; d++) {
    if (n % d === 0) s += d + (d * d === n ? 0 : n / d);
  }
  return s;
}
const deficient = Array.from({ length: 20 }, (_, i) => i + 1).filter((n) => sigma(n) < 2 * n);
console.log(deficient);
