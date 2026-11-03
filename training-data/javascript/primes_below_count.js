function countPrimesBelow(n) {
  if (n < 3) return 0;
  const sieve = new Uint8Array(n).fill(1);
  sieve[0] = sieve[1] = 0;
  for (let i = 2; i * i < n; i++) {
    if (!sieve[i]) continue;
    for (let j = i * i; j < n; j += i) sieve[j] = 0;
  }
  return sieve.reduce((a, b) => a + b, 0);
}

console.log(countPrimesBelow(100));
