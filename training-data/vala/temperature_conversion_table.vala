double c_to_f (double c) {
    return c * 9.0 / 5.0 + 32.0;
}

double c_to_k (double c) {
    return c + 273.15;
}

void main () {
    stdout.printf ("%6s %8s %8s\n", "C", "F", "K");
    for (int c = -20; c <= 100; c += 30) {
        stdout.printf ("%6d %8.1f %8.2f\n", c, c_to_f (c), c_to_k (c));
    }
}
