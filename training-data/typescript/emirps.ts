const isPrime = (n: number): boolean => {
  if (n < 2) return false;
  for (let i = 2; i * i <= n; i++) if (n % i === 0) return false;
  return true;
};
const out: number[] = [];
for (let n = 2; out.length < 10; n++) {
  const r = Number(String(n).split("").reverse().join(""));
  if (isPrime(n) && isPrime(r) && r !== n) out.push(n);
}
console.log(out.join(" ")); // 13 17 31 37 71 73 79 97 107 113
