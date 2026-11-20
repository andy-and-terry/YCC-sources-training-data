// Twin primes using a sieve stored in a Uint8Array.
function twins(limit: number): [number, number][] {
  const s = new Uint8Array(limit + 3).fill(1);
  s[0] = s[1] = 0;
  for (let i = 2; i * i <= limit + 2; i++) if (s[i]) for (let j = i * i; j <= limit + 2; j += i) s[j] = 0;
  const out: [number, number][] = [];
  for (let p = 2; p <= limit; p++) if (s[p] && s[p + 2]) out.push([p, p + 2]);
  return out;
}
console.log(twins(50));
