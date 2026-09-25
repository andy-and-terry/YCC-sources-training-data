const digitSquareSum = (n) => [...String(n)].reduce((acc, d) => acc + d * d, 0);

function isHappy(n) {
  let slow = n;
  let fast = digitSquareSum(n);
  while (fast !== 1 && slow !== fast) {
    slow = digitSquareSum(slow);
    fast = digitSquareSum(digitSquareSum(fast));
  }
  return fast === 1;
}

console.log(Array.from({ length: 49 }, (_, i) => i + 1).filter(isHappy));
module.exports = { isHappy };
