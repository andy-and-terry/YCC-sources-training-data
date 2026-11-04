const isToeplitz = (m) =>
  m.every((row, i) => i === 0 || row.every((v, j) => j === 0 || v === m[i - 1][j - 1]));

console.log(isToeplitz([[1, 2, 3], [4, 1, 2], [5, 4, 1]])); // true
console.log(isToeplitz([[1, 2], [2, 2]])); // false
