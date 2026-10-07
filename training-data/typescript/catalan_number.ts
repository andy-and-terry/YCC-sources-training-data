function catalan(n: number): number {
  const dp: number[] = new Array(n + 1).fill(0);
  dp[0] = 1;
  for (let i = 1; i <= n; i++) {
    let sum = 0;
    for (let j = 0; j < i; j++) {
      sum += dp[j] * dp[i - 1 - j];
    }
    dp[i] = sum;
  }
  return dp[n];
}

for (let i = 0; i < 8; i++) {
  console.log(`C(${i}) = ${catalan(i)}`);
}
