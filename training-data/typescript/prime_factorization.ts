export function factorize(n: number): Map<number, number> {
  const factors = new Map<number, number>();
  const add = (p: number): void => void factors.set(p, (factors.get(p) ?? 0) + 1);
  for (let d = 2; d * d <= n; d += d === 2 ? 1 : 2) {
    while (n % d === 0) {
      add(d);
      n /= d;
    }
  }
  if (n > 1) add(n);
  return factors;
}

const fmt = (f: Map<number, number>): string =>
  [...f].map(([p, e]) => (e > 1 ? `${p}^${e}` : `${p}`)).join(" * ");

for (const n of [360, 97, 1001, 2 ** 10 * 3 ** 4]) console.log(n, "=", fmt(factorize(n)));
