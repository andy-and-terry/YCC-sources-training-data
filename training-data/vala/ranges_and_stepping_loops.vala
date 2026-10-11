void main () {
    for (int i = 10; i > 0; i -= 3) {
        stdout.printf ("%d ", i);
    }
    stdout.printf ("\n");

    int n = 0;
    do {
        n += 2;
    } while (n < 7);
    stdout.printf ("do-while ended at %d\n", n);

    int total = 0;
    for (int i = 1; i <= 20; i++) {
        if (i % 2 == 0) {
            continue;
        }
        if (i > 11) {
            break;
        }
        total += i;
    }
    stdout.printf ("sum of odds up to 11: %d\n", total);

    int[] arr = { 5, 6, 7 };
    foreach (int x in arr[1:3]) {
        stdout.printf ("%d ", x);
    }
    stdout.printf ("\n");
}
