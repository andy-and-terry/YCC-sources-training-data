void main () {
    int[] seq = new int[15];
    seq[0] = 0;
    seq[1] = 1;
    for (int i = 2; i < 15; i++) {
        seq[i] = (i % 2 == 0) ? seq[i / 2] : seq[i / 2] + seq[i / 2 + 1];
    }
    foreach (int v in seq) {
        stdout.printf ("%d ", v);
    }
    stdout.printf ("\n"); // 0 1 1 2 1 3 2 3 1 4 3 5 2 5 3
}
