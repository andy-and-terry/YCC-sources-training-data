// Deficient numbers below 100; expect 76.
const properSum = (n: number): number => {
  let t = 0;
  for (let d = 1; d < n; d++) if (n % d === 0) t += d;
  return t;
};
let count = 0;
for (let n = 1; n < 100; n++) if (properSum(n) < n) count++;
console.log(count);
