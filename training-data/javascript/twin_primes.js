function sieve(n) {
  const is = new Array(n + 1).fill(true);
  is[0] = is[1] = false;
  for (let i = 2; i * i <= n; i++)
    if (is[i]) for (let j = i * i; j <= n; j += i) is[j] = false;
  return is.flatMap((p, i) => (p ? [i] : []));
}
const ps = sieve(50);
console.log(ps.slice(1).map((q, i) => [ps[i], q]).filter(([p, q]) => q - p === 2));
