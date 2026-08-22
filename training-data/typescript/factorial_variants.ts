function factorialRecursive(n: number): number {
  return n <= 1 ? 1 : n * factorialRecursive(n - 1);
}

function factorialIterative(n: number): number {
  let result = 1;
  for (let i = 2; i <= n; i++) result *= i;
  return result;
}

const factorialReduce = (n: number): number =>
  Array.from({ length: n }, (_, i) => i + 1).reduce((a, b) => a * b, 1);

console.log(factorialRecursive(5), factorialIterative(5), factorialReduce(5));
