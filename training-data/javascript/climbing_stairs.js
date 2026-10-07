function climb(n, steps = [1, 2]) {
  const ways = new Array(n + 1).fill(0);
  ways[0] = 1;
  for (let i = 1; i <= n; i++) for (const s of steps) if (s <= i) ways[i] += ways[i - s];
  return ways[n];
}

function minCostClimb(cost) {
  let a = 0, b = 0;
  for (const c of cost) [a, b] = [b, Math.min(a, b) + c];
  return Math.min(a, b);
}

console.log(Array.from({ length: 10 }, (_, i) => climb(i + 1)));
console.log(climb(10, [1, 3, 5]), minCostClimb([1, 100, 1, 1, 1, 100, 1, 1, 100, 1]));
module.exports = { climb, minCostClimb };
