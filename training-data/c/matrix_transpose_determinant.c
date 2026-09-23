#include <stdio.h>

#define MAX_N 4

void transpose(double m[MAX_N][MAX_N], int n, double out[MAX_N][MAX_N]) {
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            out[j][i] = m[i][j];
        }
    }
}

void submatrix(double m[MAX_N][MAX_N], int n, int skip_row, int skip_col, double out[MAX_N][MAX_N]) {
    int out_row = 0;
    for (int i = 0; i < n; i++) {
        if (i == skip_row) continue;
        int out_col = 0;
        for (int j = 0; j < n; j++) {
            if (j == skip_col) continue;
            out[out_row][out_col++] = m[i][j];
        }
        out_row++;
    }
}

double determinant(double m[MAX_N][MAX_N], int n) {
    if (n == 1) return m[0][0];
    if (n == 2) return m[0][0] * m[1][1] - m[0][1] * m[1][0];

    double det = 0.0;
    double sign = 1.0;
    for (int col = 0; col < n; col++) {
        double sub[MAX_N][MAX_N];
        submatrix(m, n, 0, col, sub);
        det += sign * m[0][col] * determinant(sub, n - 1);
        sign = -sign;
    }
    return det;
}

void print_matrix(double m[MAX_N][MAX_N], int n) {
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) printf("%6.2f ", m[i][j]);
        printf("\n");
    }
}

int main(void) {
    double m[MAX_N][MAX_N] = {
        {1, 2, 3},
        {0, 4, 5},
        {1, 0, 6}
    };
    int n = 3;

    double t[MAX_N][MAX_N];
    transpose(m, n, t);

    printf("original:\n");
    print_matrix(m, n);
    printf("transpose:\n");
    print_matrix(t, n);
    printf("determinant: %.2f\n", determinant(m, n));
    return 0;
}
