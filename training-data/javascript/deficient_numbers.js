// Deficient numbers below 100 (proper divisor sum < n); expect 76.
const sigma = n => {
  let t = 0;
  for (let d = 1; d < n; d++) if (n % d === 0) t += d;
  return t;
};
let count = 0;
for (let n = 1; n < 100; n++) if (sigma(n) < n) count++;
console.log(count);
