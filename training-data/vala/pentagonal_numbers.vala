// Pentagonal numbers: n(3n-1)/2.
void main () {
    var sb = new StringBuilder ();
    for (int n = 1; n <= 10; n++) sb.append ("%d ".printf (n * (3 * n - 1) / 2));
    print ("%s\n", sb.str);
}
