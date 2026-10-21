// Integer partitions counted with a coin-style DP.
function partitions(n) {
  const ways = new Array(n + 1).fill(0);
  ways[0] = 1;
  for (let part = 1; part <= n; part++) {
    for (let t = part; t <= n; t++) ways[t] += ways[t - part];
  }
  return ways[n];
}

console.log(Array.from({ length: 10 }, (_, i) => partitions(i)).join(" "));
