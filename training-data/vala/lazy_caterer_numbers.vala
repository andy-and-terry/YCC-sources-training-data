// Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
void main () {
    for (int n = 0; n < 10; n++) {
        print ("%d ", n * (n + 1) / 2 + 1);
    }
    print ("\n");
}
