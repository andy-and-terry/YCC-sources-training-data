const sigma = (n) => {
  let s = 0;
  for (let d = 1; d <= n; d++) if (n % d === 0) s += d;
  return s;
};
const out = [];
for (let n = 1; n < 100; n++) if (sigma(sigma(n)) === 2 * n) out.push(n);
console.log(out.join(" ")); // 2 4 16 64
