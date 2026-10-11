function determinant(matrix: number[][]): number {
  const n = matrix.length;
  const m = matrix.map((row) => [...row]);
  let det = 1;
  for (let col = 0; col < n; col++) {
    let pivot = col;
    for (let r = col + 1; r < n; r++) {
      if (Math.abs(m[r][col]) > Math.abs(m[pivot][col])) pivot = r;
    }
    if (Math.abs(m[pivot][col]) < 1e-12) return 0;
    if (pivot !== col) {
      [m[pivot], m[col]] = [m[col], m[pivot]];
      det = -det;
    }
    det *= m[col][col];
    for (let r = col + 1; r < n; r++) {
      const factor = m[r][col] / m[col][col];
      for (let c = col; c < n; c++) m[r][c] -= factor * m[col][c];
    }
  }
  return det;
}

console.log(determinant([[2, 0], [0, 3]]));
console.log(Math.round(determinant([[1, 2, 3], [4, 5, 6], [7, 8, 10]])));
console.log(determinant([[1, 2], [2, 4]]));
