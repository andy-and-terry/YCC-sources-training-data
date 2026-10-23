// Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)
function* tribonacci(): Generator<number> {
  let [a, b, c] = [0, 0, 1];
  while (true) {
    yield a;
    [a, b, c] = [b, c, a + b + c];
  }
}

const terms: number[] = [];
for (const t of tribonacci()) {
  if (terms.length === 15) break;
  terms.push(t);
}
console.log(`Tribonacci: ${terms.join(", ")}`);
