// Highest value reached by the Collatz (hailstone) sequence from n.
function peak(n: number): number {
  let best = n;
  while (n !== 1) {
    n = n % 2 === 0 ? n / 2 : 3 * n + 1;
    best = Math.max(best, n);
  }
  return best;
}

console.log(peak(27));
