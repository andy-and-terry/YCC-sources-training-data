// Pell numbers: P(0) = 0, P(1) = 1, P(n) = 2*P(n-1) + P(n-2).
const p: number[] = [0, 1];
for (let n = 2; n < 15; n++) {
  p.push(2 * p[n - 1] + p[n - 2]);
}
console.log(p.join(" "));
