void print_array(int[] a) {
    foreach (int v in a) stdout.printf("%d ", v);
    stdout.printf("\n");
}

void main() {
    int[] data = { 10, 20, 30, 40, 50, 60 };

    // Slices share memory with the original array.
    int[] middle = data[1:4];
    print_array(middle);

    middle[0] = 99;
    print_array(data);

    // Dynamic append
    int[] growing = {};
    for (int i = 0; i < 5; i++) {
        growing += i * i;
    }
    print_array(growing);
    stdout.printf("length: %d\n", growing.length);

    // Multidimensional arrays
    int[,] table = new int[3, 3];
    for (int r = 0; r < 3; r++)
        for (int c = 0; c < 3; c++)
            table[r, c] = (r + 1) * (c + 1);
    stdout.printf("%d\n", table[2, 2]);
}
