void main () {
    int[] data = { 10, 20, 30, 40, 50, 60 };

    int[] middle = data[1:4];
    foreach (int n in middle) {
        stdout.printf ("%d ", n);
    }
    stdout.printf ("\n");

    int[,] grid = new int[3, 3];
    for (int r = 0; r < 3; r++) {
        for (int c = 0; c < 3; c++) {
            grid[r, c] = r * 3 + c;
        }
    }
    stdout.printf ("grid[2,1] = %d, length %d x %d\n",
                   grid[2, 1], grid.length[0], grid.length[1]);

    string[] words = { "red", "green", "blue" };
    foreach (unowned string w in words) {
        stdout.printf ("%s(%d) ", w, w.length);
    }
    stdout.printf ("\n");
}
