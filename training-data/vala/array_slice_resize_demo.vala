void print_array(string label, int[] arr) {
    stdout.printf("%s:", label);
    foreach (int n in arr) {
        stdout.printf(" %d", n);
    }
    stdout.printf(" (length %d)\n", arr.length);
}

void main() {
    int[] numbers = { 10, 20, 30, 40, 50, 60 };
    print_array("original", numbers);

    int[] middle = numbers[1:4];
    print_array("slice [1:4]", middle);

    int[] grown = new int[3];
    grown[0] = 1;
    grown[1] = 2;
    grown[2] = 3;
    grown.resize(5);
    grown[3] = 4;
    grown[4] = 5;
    print_array("grown", grown);

    int[,] grid = new int[3, 4];
    for (int r = 0; r < 3; r++) {
        for (int c = 0; c < 4; c++) {
            grid[r, c] = r * c;
        }
    }
    stdout.printf("grid[2,3] = %d, rows = %d, cols = %d\n", grid[2, 3], grid.length[0], grid.length[1]);

    string[] names = { "ann", "bob" };
    names += "cy";
    stdout.printf("%s (%d)\n", string.joinv(", ", names), names.length);

    int[] copy = numbers;
    copy[0] = 99;
    stdout.printf("shared storage? original[0] = %d\n", numbers[0]);
}
