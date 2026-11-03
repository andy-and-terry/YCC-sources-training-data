bool is_perfect_square (int n) {
    if (n < 0) return false;
    int r = (int) Math.round (Math.sqrt (n));
    return r * r == n;
}

void main () {
    for (int n = 0; n < 30; n++) {
        if (is_perfect_square (n)) print ("%d ", n);
    }
    print ("\n");
}
