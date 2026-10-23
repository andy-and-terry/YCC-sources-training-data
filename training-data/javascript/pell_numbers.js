// P(n) = 2*P(n-1) + P(n-2), with P(0) = 0 and P(1) = 1
function* pell() {
  let [a, b] = [0n, 1n];
  while (true) {
    yield a;
    [a, b] = [b, 2n * b + a];
  }
}

let i = 0;
for (const p of pell()) {
  if (i === 15) break;
  console.log(`P(${i++}) = ${p}`);
}
