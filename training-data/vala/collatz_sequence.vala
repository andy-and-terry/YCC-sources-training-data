int[] collatz(int start) {
    int[] seq = { start };
    int n = start;
    while (n != 1) {
        n = (n % 2 == 0) ? n / 2 : 3 * n + 1;
        seq += n;
    }
    return seq;
}

void main() {
    var seq = collatz(6);
    foreach (int v in seq) {
        stdout.printf("%d ", v);
    }
    stdout.printf("\nsteps: %d\n", seq.length - 1);
}
