function aliquotSum(n) {
  if (n === 1) return 0;
  let sum = 1;
  for (let i = 2; i * i <= n; i++) {
    if (n % i === 0) {
      sum += i;
      if (i !== n / i) sum += n / i;
    }
  }
  return sum;
}

function classify(n) {
  const s = aliquotSum(n);
  return s === n ? "perfect" : s > n ? "abundant" : "deficient";
}

[6, 12, 28, 13].forEach((n) => console.log(n, classify(n)));
