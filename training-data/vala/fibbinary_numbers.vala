// Fibbinary numbers: no two adjacent 1 bits.
void main () {
    var sb = new StringBuilder ();
    for (int n = 0; n < 50; n++)
        if ((n & (n >> 1)) == 0) sb.append ("%d ".printf (n));
    print ("%s\n", sb.str);
}
