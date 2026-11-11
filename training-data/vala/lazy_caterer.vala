// Lazy caterer sequence: max pieces from n cuts
int term (int n) {
    return ((n * (n + 1))/2) + 1;
}

void main () {
    for (int n = 0; n < 10; n++) {
        stdout.printf ("%d ", term (n));
    }
    stdout.printf ("\n");
}
