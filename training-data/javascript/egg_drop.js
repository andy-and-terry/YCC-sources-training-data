// dp[e] = max floors distinguishable with e eggs and the current number of moves.
function eggDrop(eggs, floors) {
  const dp = new Array(eggs + 1).fill(0);
  let moves = 0;
  while (dp[eggs] < floors) {
    moves++;
    for (let e = eggs; e > 0; e--) dp[e] = dp[e] + dp[e - 1] + 1;
  }
  return moves;
}

for (const [e, f] of [[1, 10], [2, 100], [3, 1000], [4, 5000]]) {
  console.log(`${e} eggs, ${f} floors -> ${eggDrop(e, f)} drops`);
}
module.exports = { eggDrop };
