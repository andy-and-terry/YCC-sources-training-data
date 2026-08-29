int[,] transpose(int[,] matrix, int rows, int cols) {
    int[,] result = new int[cols, rows];
    for (int r = 0; r < rows; r++) {
        for (int c = 0; c < cols; c++) {
            result[c, r] = matrix[r, c];
        }
    }
    return result;
}

void main() {
    int[,] a = { {1, 2}, {3, 4} };
    var t = transpose(a, 2, 2);
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 2; j++) {
            stdout.printf("%d ", t[i, j]);
        }
        stdout.printf("\n");
    }
}
