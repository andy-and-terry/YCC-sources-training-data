type Kind = "perfect" | "abundant" | "deficient";

export function divisorSum(n: number): number {
  if (n < 2) return 0;
  let total = 1;
  for (let i = 2; i * i <= n; i++) {
    if (n % i === 0) {
      total += i;
      if (i !== n / i) total += n / i;
    }
  }
  return total;
}

export function classify(n: number): Kind {
  const s = divisorSum(n);
  return s === n ? "perfect" : s > n ? "abundant" : "deficient";
}

const counts: Record<Kind, number> = { perfect: 0, abundant: 0, deficient: 0 };
for (let n = 2; n <= 10000; n++) counts[classify(n)]++;
console.log(counts);
console.log([6, 28, 496, 8128].map(classify));
