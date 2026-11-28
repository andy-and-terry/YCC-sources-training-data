bool is_armstrong (int n) {
    int len = n.to_string ().length;
    int total = 0;
    for (int m = n; m > 0; m /= 10) {
        total += (int) Math.pow (m % 10, len);
    }
    return total == n;
}

void main () {
    for (int n = 1; n < 1000; n++) {
        if (is_armstrong (n)) {
            stdout.printf ("%d ", n);
        }
    }
    stdout.printf ("\n"); // 1..9 153 370 371 407
}
