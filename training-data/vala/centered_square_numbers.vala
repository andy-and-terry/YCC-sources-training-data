// Centered square numbers 2n(n+1)+1
int term (int n) {
    return ((2 * n) * (n + 1)) + 1;
}

void main () {
    for (int n = 0; n < 10; n++) {
        stdout.printf ("%d ", term (n));
    }
    stdout.printf ("\n");
}
