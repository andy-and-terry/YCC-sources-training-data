// Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1.
void main () {
    int64 r = 0;
    for (int i = 0; i < 8; i++) {
        r = r * 10 + 1;
        print ("%s ", r.to_string ());
    }
    print ("\n");
}
