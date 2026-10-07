int[,] build_pascal_triangle(int rows) {
    int[,] triangle = new int[rows, rows];
    for (int i = 0; i < rows; i++) {
        triangle[i, 0] = 1;
        triangle[i, i] = 1;
        for (int j = 1; j < i; j++) {
            triangle[i, j] = triangle[i - 1, j - 1] + triangle[i - 1, j];
        }
    }
    return triangle;
}

void main() {
    int rows = 6;
    int[,] triangle = build_pascal_triangle(rows);
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j <= i; j++) {
            stdout.printf("%d ", triangle[i, j]);
        }
        stdout.printf("\n");
    }
}
