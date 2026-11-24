// Hexagonal numbers: n(2n-1).
void main () {
    var sb = new StringBuilder ();
    for (int n = 1; n <= 10; n++) sb.append ("%d ".printf (n * (2 * n - 1)));
    print ("%s\n", sb.str);
}
