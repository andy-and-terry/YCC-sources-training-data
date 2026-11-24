// Centered square numbers: n^2 + (n+1)^2.
void main () {
    var sb = new StringBuilder ();
    for (int n = 0; n < 10; n++) sb.append ("%d ".printf (n * n + (n + 1) * (n + 1)));
    print ("%s\n", sb.str);
}
