const isAutomorphic = (n: number): boolean => String(n * n).endsWith(String(n));

const out: number[] = [];
for (let n = 1; n < 1000; n++) if (isAutomorphic(n)) out.push(n);
console.log(out.join(" "));
