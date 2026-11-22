// Practical numbers: every m in 1..n is a sum of distinct divisors of n.
function isPractical(n: number): boolean {
  let reach = new Set<number>([0]);
  for (let d = 1; d <= n; d++) {
    if (n % d !== 0) continue;
    reach = new Set<number>([...reach, ...[...reach].map((r) => r + d)]);
  }
  for (let m = 1; m <= n; m++) if (!reach.has(m)) return false;
  return true;
}
const out: number[] = [];
for (let n = 1; n <= 40; n++) if (isPractical(n)) out.push(n);
console.log(out.join(" "));
