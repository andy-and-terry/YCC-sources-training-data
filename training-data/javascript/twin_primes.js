// Twin primes below a limit via sieve of Eratosthenes.
function twins(limit) {
  const s = new Array(limit + 3).fill(true);
  s[0] = s[1] = false;
  for (let i = 2; i * i <= limit + 2; i++) if (s[i]) for (let j = i * i; j <= limit + 2; j += i) s[j] = false;
  const out = [];
  for (let p = 2; p <= limit; p++) if (s[p] && s[p + 2]) out.push([p, p + 2]);
  return out;
}
console.log(twins(50));
