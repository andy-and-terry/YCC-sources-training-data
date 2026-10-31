const fact = [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880];

const isFactorion = (n) =>
  n === String(n).split('').reduce((s, d) => s + fact[Number(d)], 0);

const found = [];
for (let n = 1; n < 50000; n++) if (isFactorion(n)) found.push(n);
console.log(found);
