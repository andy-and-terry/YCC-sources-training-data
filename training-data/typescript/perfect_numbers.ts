type Classification = "perfect" | "abundant" | "deficient";

function aliquotSum(n: number): number {
  if (n < 1) throw new RangeError("natural numbers only");
  let sum = n === 1 ? 0 : 1;
  for (let i = 2; i * i <= n; i++) {
    if (n % i !== 0) continue;
    sum += i;
    if (i !== n / i) sum += n / i;
  }
  return sum;
}

export function classify(n: number): Classification {
  const s = aliquotSum(n);
  return s === n ? "perfect" : s > n ? "abundant" : "deficient";
}

console.log([6, 12, 28, 13, 496].map((n) => `${n}:${classify(n)}`).join(" "));
