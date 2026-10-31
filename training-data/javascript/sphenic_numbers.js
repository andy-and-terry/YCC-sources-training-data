function exponents(n) {
  const out = [];
  for (let p = 2; p * p <= n; p++) {
    let e = 0;
    while (n % p === 0) {
      n /= p;
      e++;
    }
    if (e) out.push(e);
  }
  if (n > 1) out.push(1);
  return out;
}

const isSphenic = (n) => exponents(n).join() === '1,1,1';

console.log([...Array(78).keys()].map((i) => i + 2).filter(isSphenic));
