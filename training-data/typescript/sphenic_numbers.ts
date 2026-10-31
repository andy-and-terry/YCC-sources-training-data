function exponents(n: number): number[] {
  const out: number[] = [];
  for (let p = 2; p * p <= n; p++) {
    let e = 0;
    while (n % p === 0) {
      n /= p;
      e++;
    }
    if (e > 0) out.push(e);
  }
  if (n > 1) out.push(1);
  return out;
}

const isSphenic = (n: number): boolean => exponents(n).join() === '1,1,1';

const result: number[] = [];
for (let n = 2; n < 80; n++) if (isSphenic(n)) result.push(n);
console.log(result);
