int[,] transpose (int[,] m) {
    int rows = m.length[0];
    int cols = m.length[1];
    var t = new int[cols, rows];
    for (int r = 0; r < rows; r++) {
        for (int c = 0; c < cols; c++) {
            t[c, r] = m[r, c];
        }
    }
    return t;
}

void print_matrix (int[,] m) {
    for (int r = 0; r < m.length[0]; r++) {
        for (int c = 0; c < m.length[1]; c++) {
            stdout.printf ("%3d", m[r, c]);
        }
        stdout.printf ("\n");
    }
}

void main () {
    int[,] m = { { 1, 2, 3 }, { 4, 5, 6 } };
    print_matrix (m);
    stdout.printf ("--\n");
    print_matrix (transpose (m));
}
