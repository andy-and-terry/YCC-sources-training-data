function centralDelannoy(n: number): number {
  const g: number[][] = Array.from({ length: n + 1 }, () => new Array<number>(n + 1).fill(1));
  for (let i = 1; i <= n; i++)
    for (let j = 1; j <= n; j++) g[i][j] = g[i - 1][j] + g[i][j - 1] + g[i - 1][j - 1];
  return g[n][n];
}
console.log([0, 1, 2, 3, 4, 5].map(centralDelannoy).join(" ")); // 1 3 13 63 321 1683
