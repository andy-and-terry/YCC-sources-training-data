const digitSum = (n: number): number =>
  [...String(n)].reduce((a, c) => a + Number(c), 0);

function factorDigitSum(n: number): number {
  let total = 0;
  for (let d = 2; n > 1; d++) {
    while (n % d === 0) {
      total += digitSum(d);
      n /= d;
    }
  }
  return total;
}

function isPrime(n: number): boolean {
  for (let d = 2; d * d <= n; d++) if (n % d === 0) return false;
  return n > 1;
}

const smiths: number[] = [];
for (let n = 2; n < 100; n++) {
  if (!isPrime(n) && digitSum(n) === factorDigitSum(n)) smiths.push(n);
}
console.log(smiths.join(" "));
