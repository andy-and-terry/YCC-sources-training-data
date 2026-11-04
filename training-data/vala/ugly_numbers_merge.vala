int64 ugly (int n) {
    var seq = new int64[n];
    seq[0] = 1;
    int i2 = 0, i3 = 0, i5 = 0;
    for (int k = 1; k < n; k++) {
        int64 c2 = seq[i2] * 2, c3 = seq[i3] * 3, c5 = seq[i5] * 5;
        int64 next = int64.min (c2, int64.min (c3, c5));
        seq[k] = next;
        if (next == c2) i2++;
        if (next == c3) i3++;
        if (next == c5) i5++;
    }
    return seq[n - 1];
}

void main () {
    for (int i = 1; i <= 12; i++) print ("%s ", ugly (i).to_string ());
    print ("\n");
}
