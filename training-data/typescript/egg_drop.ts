/** Classic O(k * n^2) DP returning both the answer and the first floor to try. */
export function eggDrop(eggs: number, floors: number): { drops: number; firstFloor: number } {
  const dp = Array.from({ length: eggs + 1 }, () => new Array<number>(floors + 1).fill(0));
  const choice = Array.from({ length: eggs + 1 }, () => new Array<number>(floors + 1).fill(0));
  for (let f = 1; f <= floors; f++) {
    dp[1][f] = f;
    choice[1][f] = 1;
  }
  for (let e = 2; e <= eggs; e++) {
    for (let f = 1; f <= floors; f++) {
      dp[e][f] = Infinity;
      for (let x = 1; x <= f; x++) {
        const worst = 1 + Math.max(dp[e - 1][x - 1], dp[e][f - x]);
        if (worst < dp[e][f]) {
          dp[e][f] = worst;
          choice[e][f] = x;
        }
      }
    }
  }
  return { drops: dp[eggs][floors], firstFloor: choice[eggs][floors] };
}

console.log(eggDrop(2, 100), eggDrop(3, 100));
