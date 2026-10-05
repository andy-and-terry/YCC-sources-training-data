function factorial(n) {
  let result = 1n;
  for (let i = 2n; i <= BigInt(n); i++) result *= i;
  return result;
}

function fibonacci(n) {
  let [a, b] = [0n, 1n];
  for (let i = 0; i < n; i++) [a, b] = [b, a + b];
  return a;
}

console.log(factorial(25));
console.log(fibonacci(100));
console.log(2n ** 64n, typeof 10n);
console.log(Number.MAX_SAFE_INTEGER + 2, BigInt(Number.MAX_SAFE_INTEGER) + 2n);
console.log(7n / 2n, -7n % 3n);
