function sigma(n) {
  let s = 0;
  for (let d = 1; d * d <= n; d++) {
    if (n % d === 0) s += d + (d * d === n ? 0 : n / d);
  }
  return s;
}
const out = [];
for (let n = 1; n <= 20; n++) if (sigma(n) < 2 * n) out.push(n);
console.log(out.join(" "));
