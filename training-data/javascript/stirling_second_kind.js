// Stirling numbers of the second kind.
function stirling2(n, k) {
  const t = Array.from({ length: n + 1 }, () => new Array(k + 1).fill(0));
  t[0][0] = 1;
  for (let i = 1; i <= n; i++) {
    for (let j = 1; j <= Math.min(i, k); j++) t[i][j] = j * t[i - 1][j] + t[i - 1][j - 1];
  }
  return t[n][k];
}

console.log(stirling2(5, 2), stirling2(6, 3));
