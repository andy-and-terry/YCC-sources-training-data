void main () {
    int[] numbers = { 10, 20, 30, 40, 50, 60 };

    int[] middle = numbers[1:4];
    foreach (int n in middle) {
        print ("%d ", n);
    }
    print ("\n");

    print ("length: %d\n", numbers.length);

    int[] grown = new int[3];
    for (int i = 0; i < grown.length; i++) {
        grown[i] = i * i;
    }
    grown.resize (5);
    grown[3] = 99;
    grown[4] = 100;
    foreach (int n in grown) {
        print ("%d ", n);
    }
    print ("\n");

    int[,] grid = new int[3, 3];
    for (int r = 0; r < 3; r++) {
        for (int c = 0; c < 3; c++) {
            grid[r, c] = r * 3 + c;
        }
    }
    print ("center: %d\n", grid[1, 1]);
}
