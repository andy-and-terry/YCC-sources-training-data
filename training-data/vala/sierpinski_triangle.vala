void main () {
    int n = 8;
    for (int r = 0; r < n; r++) {
        var sb = new StringBuilder (string.nfill (n - r - 1, ' '));
        for (int c = 0; c <= r; c++)
            sb.append ((r & c) == c ? "* " : "  ");
        print ("%s\n", sb.str);
    }
}
