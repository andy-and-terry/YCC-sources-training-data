// Arrays are references to memory; use slicing or copy to duplicate.
bool arrays_equal (int[] a, int[] b) {
    if (a.length != b.length) {
        return false;
    }
    for (int i = 0; i < a.length; i++) {
        if (a[i] != b[i]) {
            return false;
        }
    }
    return true;
}

void main () {
    int[] original = { 3, 1, 4, 1, 5 };

    int[] copy = original[0:original.length];
    copy[0] = 99;
    stdout.printf ("original[0]=%d copy[0]=%d\n", original[0], copy[0]);

    int[] same = new int[original.length];
    Memory.copy (same, original, original.length * sizeof (int));
    stdout.printf ("equal: %s\n", arrays_equal (original, same).to_string ());
    stdout.printf ("equal copy: %s\n", arrays_equal (original, copy).to_string ());

    int[,] grid = new int[2, 3];
    for (int r = 0; r < 2; r++) {
        for (int c = 0; c < 3; c++) {
            grid[r, c] = r * 3 + c;
        }
    }
    stdout.printf ("grid[1,2]=%d lengths=%d x %d\n", grid[1, 2], grid.length[0], grid.length[1]);
}
