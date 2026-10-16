class PrefixSum2D {
  private readonly sums: number[][];

  constructor(matrix: number[][]) {
    const rows = matrix.length;
    const cols = rows === 0 ? 0 : matrix[0].length;
    this.sums = Array.from({ length: rows + 1 }, () => new Array<number>(cols + 1).fill(0));
    for (let r = 0; r < rows; r++) {
      for (let c = 0; c < cols; c++) {
        this.sums[r + 1][c + 1] =
          matrix[r][c] + this.sums[r][c + 1] + this.sums[r + 1][c] - this.sums[r][c];
      }
    }
  }

  regionSum(r1: number, c1: number, r2: number, c2: number): number {
    const s = this.sums;
    return s[r2 + 1][c2 + 1] - s[r1][c2 + 1] - s[r2 + 1][c1] + s[r1][c1];
  }
}

const ps = new PrefixSum2D([
  [3, 0, 1, 4],
  [5, 6, 3, 2],
  [1, 2, 0, 1],
]);
console.log(ps.regionSum(0, 0, 1, 1));
console.log(ps.regionSum(1, 1, 2, 3));
