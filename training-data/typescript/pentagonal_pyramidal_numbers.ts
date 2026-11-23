// n^2(n+1)/2
function term(n: number): number {
  return Math.floor(((n * n) * (n + 1)) / 2);
}

for (let n = 1; n <= 15; n++) {
  console.log(`${n} -> ${term(n)}`);
}
