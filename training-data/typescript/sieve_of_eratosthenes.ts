function sieve(limit: number): number[] {
  const isPrime = new Array<boolean>(limit + 1).fill(true);
  isPrime[0] = isPrime[1] = false;
  for (let n = 2; n * n <= limit; n++) {
    if (isPrime[n]) {
      for (let multiple = n * n; multiple <= limit; multiple += n) {
        isPrime[multiple] = false;
      }
    }
  }
  return isPrime.reduce<number[]>((primes, prime, n) => (prime ? [...primes, n] : primes), []);
}

console.log(sieve(50));
