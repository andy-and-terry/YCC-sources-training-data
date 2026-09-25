#include <stdio.h>
#include <stdlib.h>

/* Compressed sparse row (CSR) matrix built from a dense array. */
typedef struct {
    int rows, cols, nnz;
    double *values;
    int *col_idx, *row_ptr;
} csr;

csr csr_from_dense(const double *dense, int rows, int cols) {
    csr m = {rows, cols, 0, NULL, NULL, NULL};
    for (int i = 0; i < rows * cols; i++) m.nnz += dense[i] != 0.0;
    m.values = malloc((size_t)m.nnz * sizeof *m.values);
    m.col_idx = malloc((size_t)m.nnz * sizeof *m.col_idx);
    m.row_ptr = malloc((size_t)(rows + 1) * sizeof *m.row_ptr);
    int k = 0;
    for (int r = 0; r < rows; r++) {
        m.row_ptr[r] = k;
        for (int c = 0; c < cols; c++) {
            double v = dense[r * cols + c];
            if (v != 0.0) {
                m.values[k] = v;
                m.col_idx[k++] = c;
            }
        }
    }
    m.row_ptr[rows] = k;
    return m;
}

void csr_mul_vec(const csr *m, const double *x, double *y) {
    for (int r = 0; r < m->rows; r++) {
        double s = 0;
        for (int k = m->row_ptr[r]; k < m->row_ptr[r + 1]; k++) s += m->values[k] * x[m->col_idx[k]];
        y[r] = s;
    }
}

void csr_free(csr *m) {
    free(m->values);
    free(m->col_idx);
    free(m->row_ptr);
}

int main(void) {
    double dense[16] = {4, 0, 0, 1, 0, 0, 2, 0, 0, 3, 0, 0, 1, 0, 0, 5};
    double x[4] = {1, 2, 3, 4}, y[4];
    csr m = csr_from_dense(dense, 4, 4);
    csr_mul_vec(&m, x, y);
    printf("nnz=%d  A*x = [%g %g %g %g]\n", m.nnz, y[0], y[1], y[2], y[3]);
    csr_free(&m);
    return 0;
}
