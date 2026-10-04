const big = 2n ** 100n;
console.log(big);
console.log(typeof big);

console.log(Number.MAX_SAFE_INTEGER + 2);
console.log(BigInt(Number.MAX_SAFE_INTEGER) + 2n);

function factorial(n) {
  let result = 1n;
  for (let i = 2n; i <= n; i++) result *= i;
  return result;
}
console.log(factorial(30n));

console.log(7n / 2n, -7n % 3n);
console.log(10n > 9, 10n === 10, 10n == 10);

try {
  console.log(1n + 1);
} catch (e) {
  console.log(e.constructor.name + ': ' + e.message);
}

console.log(BigInt.asUintN(8, 257n));
console.log((255n).toString(16), BigInt('0xff'));

function fibBig(n) {
  let [a, b] = [0n, 1n];
  for (let i = 0; i < n; i++) [a, b] = [b, a + b];
  return a;
}
console.log(fibBig(150));
