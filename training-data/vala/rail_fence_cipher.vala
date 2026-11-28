string encrypt (string text, int k) {
    int cycle = 2 * (k - 1);
    var sb = new StringBuilder ();
    for (int r = 0; r < k; r++) {
        for (int i = 0; i < text.length; i++) {
            int m = i % cycle;
            int rail = m < k ? m : cycle - m;
            if (rail == r) sb.append_c (text[i]);
        }
    }
    return sb.str;
}

void main () {
    print ("%s\n", encrypt ("WEAREDISCOVERED", 3));
}
