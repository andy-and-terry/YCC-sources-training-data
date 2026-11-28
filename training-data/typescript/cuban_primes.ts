const isPrime = (n: number): boolean => {
  if (n < 2) return false;
  for (let i = 2; i * i <= n; i++) if (n % i === 0) return false;
  return true;
};

function* cuban(): Generator<number> {
  for (let y = 1; ; y++) {
    const p = 3 * y * y + 3 * y + 1;
    if (isPrime(p)) yield p;
  }
}

const it = cuban();
console.log(Array.from({ length: 8 }, () => it.next().value));
