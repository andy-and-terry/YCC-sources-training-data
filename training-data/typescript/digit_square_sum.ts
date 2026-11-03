const digitSquareSum = (n: number): number =>
  [...String(Math.abs(n))].reduce((acc, d) => acc + Number(d) ** 2, 0);

console.log(digitSquareSum(123));
