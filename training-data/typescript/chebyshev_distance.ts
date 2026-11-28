const chebyshev = (a: number[], b: number[]): number =>
  Math.max(...a.map((x, i) => Math.abs(x - b[i])));
console.log(chebyshev([1, 2], [4, 6]));
