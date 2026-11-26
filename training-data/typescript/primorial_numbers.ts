// Primorials up to 1e6, including 1; expect 8.
const isPrime = (n: number): boolean => {
  if (n < 2) return false;
  for (let d = 2; d * d <= n; d++) if (n % d === 0) return false;
  return true;
};
const values: number[] = [1];
let acc = 1;
for (let p = 2; ; p++) {
  if (!isPrime(p)) continue;
  acc *= p;
  if (acc > 1e6) break;
  values.push(acc);
}
console.log(values.length, values.join(' '));
