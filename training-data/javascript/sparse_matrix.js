class SparseMatrix {
  constructor(rows, cols, entries = new Map()) {
    this.rows = rows;
    this.cols = cols;
    this.data = new Map([...entries].filter(([, v]) => v !== 0));
  }

  static fromDense(dense) {
    const m = new SparseMatrix(dense.length, dense[0].length);
    dense.forEach((row, r) => row.forEach((v, c) => v && m.data.set(`${r},${c}`, v)));
    return m;
  }

  get(r, c) {
    return this.data.get(`${r},${c}`) ?? 0;
  }

  multiply(o) {
    const out = new Map();
    for (const [k, v] of this.data) {
      const [r, i] = k.split(",").map(Number);
      for (let c = 0; c < o.cols; c++) {
        const w = o.get(i, c);
        if (w) out.set(`${r},${c}`, (out.get(`${r},${c}`) ?? 0) + v * w);
      }
    }
    return new SparseMatrix(this.rows, o.cols, out);
  }

  transpose() {
    const out = new Map();
    for (const [k, v] of this.data) {
      const [r, c] = k.split(",");
      out.set(`${c},${r}`, v);
    }
    return new SparseMatrix(this.cols, this.rows, out);
  }

  toDense() {
    return Array.from({ length: this.rows }, (_, r) => Array.from({ length: this.cols }, (_, c) => this.get(r, c)));
  }
}

const a = SparseMatrix.fromDense([[1, 0, 0], [0, 0, 2], [0, 3, 0]]);
const b = SparseMatrix.fromDense([[0, 4, 0], [5, 0, 0], [0, 0, 6]]);
console.log(a.multiply(b).toDense(), a.transpose().toDense());
module.exports = { SparseMatrix };
