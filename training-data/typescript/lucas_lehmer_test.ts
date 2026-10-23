function isPrime(n: number): boolean {
  for (let d = 2; d * d <= n; d++) if (n % d === 0) return false;
  return n > 1;
}

function lucasLehmer(p: number): boolean {
  if (p === 2) return true;
  const m: bigint = (1n << BigInt(p)) - 1n;
  let s: bigint = 4n;
  for (let i = 0; i < p - 2; i++) s = (s * s - 2n) % m;
  return s === 0n;
}

const exps: number[] = [];
for (let p = 2; p <= 19; p++) {
  if (isPrime(p) && lucasLehmer(p)) exps.push(p);
}
console.log(exps.join(" "));
