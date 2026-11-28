const fact = [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880];
const isFactorion = (n) =>
  String(n).split("").reduce((s, d) => s + fact[+d], 0) === n;

const out = [];
for (let n = 1; n < 50000; n++) if (isFactorion(n)) out.push(n);
console.log(out); // [1, 2, 145, 40585]
