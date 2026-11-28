bool is_happy (int n) {
    var seen = new Gee.HashSet<int> ();
    while (n != 1 && seen.add (n)) {
        int s = 0;
        for (int m = n; m > 0; m /= 10) {
            s += (m % 10) * (m % 10);
        }
        n = s;
    }
    return n == 1;
}

void main () {
    int count = 0;
    for (int n = 1; count < 8; n++) {
        if (is_happy (n)) {
            stdout.printf ("%d ", n);
            count++;
        }
    }
    stdout.printf ("\n"); // 1 7 10 13 19 23 28 31
}
