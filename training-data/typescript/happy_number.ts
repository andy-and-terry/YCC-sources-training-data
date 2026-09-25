const digitSquareSum = (n: number): number => [...String(n)].reduce((acc, d) => acc + Number(d) ** 2, 0);

export function isHappy(n: number): boolean {
  const seen = new Set<number>();
  while (n !== 1 && !seen.has(n)) {
    seen.add(n);
    n = digitSquareSum(n);
  }
  return n === 1;
}

console.log(Array.from({ length: 49 }, (_, i) => i + 1).filter(isHappy));
