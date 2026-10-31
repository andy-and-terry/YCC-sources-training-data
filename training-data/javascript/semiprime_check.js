function primeFactorCount(n) {
  let count = 0;
  for (let p = 2; p * p <= n; p++) {
    while (n % p === 0) {
      n /= p;
      count++;
    }
  }
  return count + (n > 1 ? 1 : 0);
}

const semiprimes = [];
for (let n = 2; n < 30; n++) if (primeFactorCount(n) === 2) semiprimes.push(n);
console.log(semiprimes);
