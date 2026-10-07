function eggDrop(eggs: number, floors: number): number {
  const dp: number[][] = Array.from({ length: eggs + 1 }, () =>
    new Array(floors + 1).fill(0),
  );

  for (let j = 1; j <= floors; j++) dp[1][j] = j;
  for (let i = 1; i <= eggs; i++) dp[i][0] = 0;

  for (let i = 2; i <= eggs; i++) {
    for (let j = 1; j <= floors; j++) {
      let best = Infinity;
      for (let x = 1; x <= j; x++) {
        const worstCase = 1 + Math.max(dp[i - 1][x - 1], dp[i][j - x]);
        best = Math.min(best, worstCase);
      }
      dp[i][j] = best;
    }
  }

  return dp[eggs][floors];
}

console.log(eggDrop(2, 10));
console.log(eggDrop(1, 5));
console.log(eggDrop(3, 14));
