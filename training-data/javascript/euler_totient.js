function phi(n) {
  let result = n;
  for (let p = 2; p * p <= n; p++) {
    if (n % p === 0) {
      while (n % p === 0) n /= p;
      result -= result / p;
    }
  }
  if (n > 1) result -= result / n;
  return result;
}

function phiSieve(limit) {
  const phis = Array.from({ length: limit + 1 }, (_, i) => i);
  for (let i = 2; i <= limit; i++) {
    if (phis[i] === i) for (let j = i; j <= limit; j += i) phis[j] -= phis[j] / i;
  }
  return phis;
}

const direct = Array.from({ length: 20 }, (_, i) => phi(i + 1));
console.log(direct.join(" "));
console.log("sieve matches:", phiSieve(20).slice(1).every((v, i) => v === direct[i]));
module.exports = { phi, phiSieve };
