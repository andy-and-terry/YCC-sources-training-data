// Padovan sequence: P(n) = P(n-2) + P(n-3), with P(0) = P(1) = P(2) = 1.
const p: number[] = [1, 1, 1];
for (let n = 3; n < 15; n++) {
  p.push(p[n - 2] + p[n - 3]);
}
console.log(p.join(" "));
