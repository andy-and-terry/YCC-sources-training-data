type Matrix = number[][];
function mul(a: Matrix, b: Matrix): Matrix {
  return a.map((row) => b[0].map((_, j) => row.reduce((s, v, k) => s + v * b[k][j], 0)));
}
console.log(mul([[1, 2], [3, 4]], [[0, 1], [1, 0]]));
