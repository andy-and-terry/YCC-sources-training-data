// Tetrahedral numbers n(n+1)(n+2)/6
int term (int n) {
    return ((n * (n + 1)) * (n + 2))/6;
}

void main () {
    for (int n = 0; n < 10; n++) {
        stdout.printf ("%d ", term (n));
    }
    stdout.printf ("\n");
}
