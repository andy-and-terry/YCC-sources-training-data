function divisorSum(n) {
  if (n < 2) return 0;
  let total = 1;
  for (let i = 2; i * i <= n; i++) {
    if (n % i === 0) {
      total += i;
      if (i !== n / i) total += n / i;
    }
  }
  return total;
}

function classify(n) {
  const s = divisorSum(n);
  return s === n ? "perfect" : s > n ? "abundant" : "deficient";
}

const perfect = [];
for (let n = 2; n < 10000; n++) if (divisorSum(n) === n) perfect.push(n);
console.log(perfect);
for (const n of [12, 28, 35]) console.log(n, classify(n));
module.exports = { divisorSum, classify };
