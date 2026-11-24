// Aliquot sequence: replace n by the sum of its proper divisors.
// Build with: valac --pkg gee-0.8 aliquot_sequence.vala
int aliquot_sum (int n) {
    int s = 0;
    for (int d = 1; d <= n / 2; d++)
        if (n % d == 0) s += d;
    return s;
}

void main () {
    var seq = new Gee.ArrayList<int> ();
    seq.add (12);
    while (seq.last () > 1 && seq.size < 20)
        seq.add (aliquot_sum (seq.last ()));
    var sb = new StringBuilder ();
    foreach (int x in seq) sb.append ("%d ".printf (x));
    print ("%s\n", sb.str);
}
