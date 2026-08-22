function isPrime(n) {
  if (n < 2) return false;
  if (n === 2 || n === 3) return true;
  if (n % 2 === 0) return false;
  for (let i = 3; i * i <= n; i += 2) {
    if (n % i === 0) return false;
  }
  return true;
}

const primes = Array.from({ length: 20 }, (_, i) => i).filter(isPrime);
console.log(primes);

module.exports = { isPrime };
