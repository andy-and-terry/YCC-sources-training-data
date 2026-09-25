export function binomial(n: number, k: number): bigint {
  if (k < 0 || k > n) return 0n;
  k = Math.min(k, n - k);
  let r = 1n;
  for (let i = 1; i <= k; i++) r = (r * BigInt(n - k + i)) / BigInt(i);
  return r;
}

export function binomialModPrime(n: number, k: number, p: number): number {
  // Lucas' theorem for small prime p
  let result = 1;
  while (n > 0 || k > 0) {
    const ni = n % p, ki = k % p;
    if (ki > ni) return 0;
    result = (result * Number(binomial(ni, ki) % BigInt(p))) % p;
    n = Math.floor(n / p);
    k = Math.floor(k / p);
  }
  return result;
}

console.log(binomial(10, 3), binomial(52, 5), binomial(100, 50));
console.log(binomialModPrime(1000, 300, 13), Number(binomial(1000, 300) % 13n));
