function divisorSum(n) {
  let s = 0;
  for (let d = 1; d < n; d++) if (n % d === 0) s += d;
  return s;
}

const out = [];
for (let n = 1; n < 60; n++) if (divisorSum(n) > n) out.push(n);
console.log(out.join(" "));
