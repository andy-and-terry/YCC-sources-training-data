const isAutomorphic = (n: number): boolean => String(BigInt(n) ** 2n).endsWith(String(n));

const result: number[] = [];
for (let n = 0; n < 1000; n++) if (isAutomorphic(n)) result.push(n);
console.log(result); // [0, 1, 5, 6, 25, 76, 376, 625]
