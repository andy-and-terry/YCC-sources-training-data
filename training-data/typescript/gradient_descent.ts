function gradientDescent(
  gradFn: (x: number) => number,
  start = 0,
  learningRate = 0.1,
  iterations = 100
): number {
  let x = start;
  for (let i = 0; i < iterations; i++) {
    x -= learningRate * gradFn(x);
  }
  return x;
}

const minimum = gradientDescent((x) => 2 * (x - 3), 0, 0.1, 50);
console.log(minimum.toFixed(4));
