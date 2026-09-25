class SparseMatrix:
    def __init__(self, rows, cols, entries=None):
        self.rows, self.cols = rows, cols
        self.data = {k: v for k, v in (entries or {}).items() if v}

    @classmethod
    def from_dense(cls, dense):
        return cls(len(dense), len(dense[0]),
                   {(r, c): v for r, row in enumerate(dense) for c, v in enumerate(row) if v})

    def __add__(self, other):
        out = dict(self.data)
        for k, v in other.data.items():
            out[k] = out.get(k, 0) + v
        return SparseMatrix(self.rows, self.cols, out)

    def __matmul__(self, other):
        by_row = {}
        for (r, c), v in other.data.items():
            by_row.setdefault(r, []).append((c, v))
        out = {}
        for (r, k), v in self.data.items():
            for c, w in by_row.get(k, ()):
                out[(r, c)] = out.get((r, c), 0) + v * w
        return SparseMatrix(self.rows, other.cols, out)

    def transpose(self):
        return SparseMatrix(self.cols, self.rows, {(c, r): v for (r, c), v in self.data.items()})

    def to_dense(self):
        return [[self.data.get((r, c), 0) for c in range(self.cols)] for r in range(self.rows)]


if __name__ == "__main__":
    a = SparseMatrix.from_dense([[1, 0, 0], [0, 0, 2], [0, 3, 0]])
    b = SparseMatrix.from_dense([[0, 4, 0], [5, 0, 0], [0, 0, 6]])
    print((a @ b).to_dense())
    print((a + b).transpose().to_dense())
