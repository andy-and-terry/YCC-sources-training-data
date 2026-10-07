void main() {
    int[] numbers = {10, 20, 30, 40, 50};
    int[] middle = numbers[1:4];
    foreach (int n in middle) {
        stdout.printf("%d ", n);
    }
    stdout.printf("\n");

    numbers += 60;
    stdout.printf("length after append: %d\n", numbers.length);

    numbers.resize(3);
    stdout.printf("length after resize: %d\n", numbers.length);

    int[,] grid = new int[3, 3];
    for (int r = 0; r < 3; r++) {
        for (int c = 0; c < 3; c++) {
            grid[r, c] = r * 3 + c;
        }
    }
    stdout.printf("grid[2,1] = %d, dims %d x %d\n", grid[2, 1], grid.length[0], grid.length[1]);
}
