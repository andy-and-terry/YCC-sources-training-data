function isPrime(n) {
  if (n < 2) return false;
  for (let i = 2; i * i <= n; i++) if (n % i === 0) return false;
  return true;
}

function emirps(limit) {
  const out = [];
  for (let p = 2; p < limit; p++) {
    const r = Number(String(p).split("").reverse().join(""));
    if (r !== p && isPrime(p) && isPrime(r)) out.push(p);
  }
  return out;
}

console.log(emirps(200).join(", "));
// 13, 17, 31, 37, 71, 73, 79, 97, 107, 113, 149, 157, 167, 179, 199
