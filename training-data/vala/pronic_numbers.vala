bool is_pronic (int x) {
    int n = (int) Math.floor (Math.sqrt (x));
    return n * (n + 1) == x;
}

void main () {
    for (int n = 0; n < 10; n++) {
        stdout.printf ("%d ", n * (n + 1));
    }
    stdout.printf ("\n"); // 0 2 6 12 20 30 42 56 72 90
    stdout.printf ("%s %s\n", is_pronic (56).to_string (), is_pronic (57).to_string ()); // true false
}
