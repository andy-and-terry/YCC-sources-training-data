// Ways to write n as a sum of two or more consecutive positive integers.
function politeWays(n) {
  let ways = 0;
  for (let k = 2; (k * (k + 1)) / 2 <= n; k++) {
    const rest = n - (k * (k - 1)) / 2;
    if (rest % k === 0) ways++;
  }
  return ways;
}
const out = [];
for (let n = 1; n <= 16; n++) out.push(politeWays(n));
console.log(out.join(" "));
