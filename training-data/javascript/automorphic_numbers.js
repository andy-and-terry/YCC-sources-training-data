const isAutomorphic = (n) => String(BigInt(n) ** 2n).endsWith(String(n));

const out = [];
for (let n = 0; n < 1000; n++) if (isAutomorphic(n)) out.push(n);
console.log(out); // [0, 1, 5, 6, 25, 76, 376, 625]
