function cubeFromOdds(n: number): number {
  const start = n * n - n + 1;
  return Array.from({ length: n }, (_, i) => start + 2 * i).reduce((a, b) => a + b, 0);
}

for (let n = 1; n <= 5; n++) {
  console.log(n, cubeFromOdds(n), cubeFromOdds(n) === n ** 3);
}
