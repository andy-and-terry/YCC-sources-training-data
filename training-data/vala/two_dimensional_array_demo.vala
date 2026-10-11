void main () {
    int[,] grid = new int[3, 4];
    for (int r = 0; r < 3; r++) {
        for (int c = 0; c < 4; c++) {
            grid[r, c] = r * 4 + c;
        }
    }
    stdout.printf ("rows=%d cols=%d\n", grid.length[0], grid.length[1]);
    for (int r = 0; r < grid.length[0]; r++) {
        for (int c = 0; c < grid.length[1]; c++) {
            stdout.printf ("%3d", grid[r, c]);
        }
        stdout.printf ("\n");
    }
}
