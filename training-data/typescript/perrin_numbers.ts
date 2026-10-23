// Perrin numbers: P(0) = 3, P(1) = 0, P(2) = 2, P(n) = P(n-2) + P(n-3)
const p: number[] = [3, 0, 2];
for (let n = 3; n < 15; n++) p.push(p[n - 2] + p[n - 3]);
console.log(p.join(" "));
