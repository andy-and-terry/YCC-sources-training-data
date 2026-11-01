// n is triangular iff 8n + 1 is a perfect square.
bool is_triangular (int n) {
    int s = 8 * n + 1;
    int r = (int) Math.round (Math.sqrt (s));
    return r * r == s;
}

void main () {
    for (int n = 0; n <= 20; n++) {
        if (is_triangular (n)) print ("%d ", n);
    }
    print ("\n");
}
