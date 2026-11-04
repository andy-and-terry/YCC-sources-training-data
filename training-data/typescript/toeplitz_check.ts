type Matrix<T> = readonly (readonly T[])[];

function isToeplitz<T>(m: Matrix<T>): boolean {
  return m.every((row, i) => i === 0 || row.every((v, j) => j === 0 || v === m[i - 1][j - 1]));
}

console.log(isToeplitz([[1, 2, 3], [4, 1, 2], [5, 4, 1]])); // true
console.log(isToeplitz([["a", "b"], ["b", "b"]])); // false
