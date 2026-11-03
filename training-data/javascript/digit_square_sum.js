const digitSquareSum = (n) =>
  [...String(Math.abs(n))].reduce((acc, d) => acc + Number(d) ** 2, 0);

console.log(digitSquareSum(123));
console.log(digitSquareSum(-99));
