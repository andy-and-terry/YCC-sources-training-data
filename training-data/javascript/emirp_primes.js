const isPrime = (n) => {
  if (n < 2) return false;
  for (let i = 2; i * i <= n; i++) if (n % i === 0) return false;
  return true;
};
const rev = (n) => Number([...String(n)].reverse().join(""));

const emirps = (limit) => {
  const out = [];
  for (let p = 2; p < limit; p++) {
    if (isPrime(p) && rev(p) !== p && isPrime(rev(p))) out.push(p);
  }
  return out;
};

console.log(emirps(100).join(" "));
