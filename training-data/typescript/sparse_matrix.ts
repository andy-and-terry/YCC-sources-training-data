/** Compressed Sparse Row matrix with matrix-vector multiplication. */
export class CsrMatrix {
  private constructor(
    readonly rows: number,
    readonly cols: number,
    private readonly values: number[],
    private readonly colIdx: number[],
    private readonly rowPtr: number[],
  ) {}

  static fromDense(dense: readonly number[][]): CsrMatrix {
    const values: number[] = [], colIdx: number[] = [], rowPtr = [0];
    for (const row of dense) {
      row.forEach((v, c) => {
        if (v !== 0) {
          values.push(v);
          colIdx.push(c);
        }
      });
      rowPtr.push(values.length);
    }
    return new CsrMatrix(dense.length, dense[0]?.length ?? 0, values, colIdx, rowPtr);
  }

  get nnz(): number {
    return this.values.length;
  }

  mulVec(x: readonly number[]): number[] {
    if (x.length !== this.cols) throw new RangeError("dimension mismatch");
    return Array.from({ length: this.rows }, (_, r) => {
      let s = 0;
      for (let k = this.rowPtr[r]; k < this.rowPtr[r + 1]; k++) s += this.values[k] * x[this.colIdx[k]];
      return s;
    });
  }
}

const m = CsrMatrix.fromDense([[4, 0, 0, 1], [0, 0, 2, 0], [0, 3, 0, 0], [1, 0, 0, 5]]);
console.log("nnz:", m.nnz, "A*x:", m.mulVec([1, 2, 3, 4]));
