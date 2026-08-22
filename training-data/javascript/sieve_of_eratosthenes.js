function sieve(limit) {
  const isPrime = new Array(limit + 1).fill(true);
  isPrime[0] = isPrime[1] = false;
  for (let n = 2; n * n <= limit; n++) {
    if (isPrime[n]) {
      for (let multiple = n * n; multiple <= limit; multiple += n) {
        isPrime[multiple] = false;
      }
    }
  }
  return isPrime.reduce((primes, prime, n) => (prime ? [...primes, n] : primes), []);
}

console.log(sieve(50));
module.exports = { sieve };
