const squareDigitSum = (n: number): number =>
  [...String(n)].reduce((s, d) => s + Number(d) ** 2, 0);

export function isHappy(n: number): boolean {
  const seen = new Set<number>();
  while (n !== 1 && !seen.has(n)) {
    seen.add(n);
    n = squareDigitSum(n);
  }
  return n === 1;
}

console.log(Array.from({ length: 50 }, (_, i) => i + 1).filter(isHappy));
