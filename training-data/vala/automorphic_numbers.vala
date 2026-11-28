bool is_automorphic (int64 n) {
    return (n * n).to_string ().has_suffix (n.to_string ());
}

void main () {
    for (int64 n = 0; n < 1000; n++) {
        if (is_automorphic (n)) {
            stdout.printf ("%lld ", n);
        }
    }
    stdout.printf ("\n"); // 0 1 5 6 25 76 376 625
}
