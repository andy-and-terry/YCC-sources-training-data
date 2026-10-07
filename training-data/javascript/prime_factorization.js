function factorize(n) {
  const factors = new Map();
  for (let d = 2; d * d <= n; d += d === 2 ? 1 : 2) {
    while (n % d === 0) {
      factors.set(d, (factors.get(d) || 0) + 1);
      n /= d;
    }
  }
  if (n > 1) factors.set(n, (factors.get(n) || 0) + 1);
  return factors;
}

const fmt = (f) => [...f].map(([p, e]) => (e > 1 ? `${p}^${e}` : `${p}`)).join(" * ");

for (const n of [360, 97, 1001, 2 ** 10 * 3 ** 4]) console.log(n, "=", fmt(factorize(n)));
module.exports = { factorize };
