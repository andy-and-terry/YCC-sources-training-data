function binomial(n, k) {
  if (k < 0 || k > n) return 0n;
  k = Math.min(k, n - k);
  let r = 1n;
  for (let i = 1; i <= k; i++) r = (r * BigInt(n - k + i)) / BigInt(i);
  return r;
}

function pascalRow(n) {
  const row = [1];
  for (let k = 1; k <= n; k++) row.push((row[k - 1] * (n - k + 1)) / k);
  return row;
}

console.log(binomial(10, 3), binomial(52, 5), binomial(100, 50));
console.log(pascalRow(10).join(" "));
module.exports = { binomial, pascalRow };
