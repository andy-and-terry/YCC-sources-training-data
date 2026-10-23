const isAutomorphic = (n) => String(n * n).endsWith(String(n));

const out = [];
for (let n = 1; n < 1000; n++) if (isAutomorphic(n)) out.push(n);
console.log(out.join(" "));
