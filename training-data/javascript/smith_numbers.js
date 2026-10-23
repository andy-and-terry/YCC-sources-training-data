const digitSum = (n) => [...String(n)].reduce((a, c) => a + Number(c), 0);

function factorDigitSum(n) {
  let total = 0;
  for (let d = 2; n > 1; d++) {
    while (n % d === 0) {
      total += digitSum(d);
      n /= d;
    }
  }
  return total;
}

function isPrime(n) {
  for (let d = 2; d * d <= n; d++) if (n % d === 0) return false;
  return n > 1;
}

const smiths = [];
for (let n = 2; n < 100; n++) {
  if (!isPrime(n) && digitSum(n) === factorDigitSum(n)) smiths.push(n);
}
console.log(smiths.join(" "));
