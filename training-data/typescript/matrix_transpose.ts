function transpose(matrix: number[][]): number[][] {
  return matrix[0].map((_, colIndex) => matrix.map((row) => row[colIndex]));
}

console.log(transpose([[1, 2, 3], [4, 5, 6]]));
